require 'addressable/uri'
module ResumesHelper
	def education(e, cust=nil, repr=nil)
		slots_hash = Hash.new()
    if e.object.section_slots.present?
	    education=repr.present? ? e.object.section_slots.collect(&:section).last : cust.present? ? e.object.section_slots.collect(&:section).second : e.object.section_slots.collect(&:section).first
	    education.positions.collect{|p| slots_hash[p]=education.columns[education.positions.index(p)]} 
	  end
	  return slots_hash
	end

	def final_resume(e, cust)
		slots_hash = Hash.new()
    if e.section_slots.present?
	    education=cust.present? ? e.section_slots.collect(&:section).last : e.section_slots.collect(&:section).first
	    education.positions.collect{|p| slots_hash[p]=education.columns[education.positions.index(p)]}
	  end
	  return slots_hash
	end
	
	def embed(url)
	    # youtube_id = youtube_url.split("=").last
	    # content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}")
	    # yt_regexp = /^(?:https?:\/\/)?(?:www\.)?youtu(?:\.be|be\.com)\/(?:watch\?v=)?([\w-]{10,})/
	    # vimeo_regexp = /^http:\/\/www\.vimeo\.com\/(\d+)/
	    # https://youtu.be/QtHn55X1crM
	    # https://www.youtube.com/watch?v=QtHn55X1crM
	    # https://vimeo.com/117408881  
	    uri = Addressable::URI.parse(url)
	     if uri.host == "vimeo.com" 
	     	vimeo_id = uri.basename
	     	content_tag(:iframe,nil,src: "//player.vimeo.com/video/#{vimeo_id}") 

	     elsif uri.host == "www.youtube.com"
	     	youtube_id = url.split("=").last 
	        content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}")

	     elsif uri.host == "youtu.be" 
	     	 youtube_id = uri.basename
	     	 content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}")  
	     end	
	 #    if uri.host == "vimeo.com" 
		#     AutoHtml.add_filter(:vimeo).with(:width => 440, :height => 248, :show_title => false, :show_byline => false, :show_portrait => false, :allow_fullscreen => false) do |url, options|
		# 		url.gsub(/https?:\/\/(www.)?vimeo\.com\/([A-Za-z0-9._%-]*)((\?|#)\S+)?/) do
		# 			vimeo_id = $2
		# 			width = options[:width]
		# 			height = options[:height]
		# 			show_title = "title=0" unless options[:show_title]
		# 			show_byline = "byline=0" unless options[:show_byline]
		# 			show_portrait = "portrait=0" unless options[:show_portrait]
		# 			allow_fullscreen = " webkitallowfullscreen mozallowfullscreen allowfullscreen" if options[:allow_fullscreen]
		# 			frameborder = options[:frameborder] || 0
		# 			query_string_variables = [show_title, show_byline, show_portrait].compact.join("&")
		# 			query_string = "?" + query_string_variables unless query_string_variables.empty?
		# 			%{<iframe src="//player.vimeo.com/video/#{vimeo_id}#{query_string}" width="#{width}" height="#{height}" frameborder="#{frameborder}"#{allow_fullscreen}></iframe>}
		# 		end
		# 	end
		# elsif uri.host == "www.youtube.com" || uri.host == 'youtu.be'
			# AutoHtml.add_filter(:youtube).with(:width => 420, :height => 315, :frameborder => 0, :wmode => nil, :autoplay => false, :hide_related => false) do |"https://www.youtube.com/watch?v=QtHn55X1crM", options|
			# 	regex = /(https?:\/\/)?(www.)?(youtube\.com\/watch\?v=|youtu\.be\/|youtube\.com\/watch\?feature=player_embedded&v=)([A-Za-z0-9_-]*)(\&\S+)?(\?\S+)?/
			# 		url.gsub(regex) do
			# 		youtube_id = $4
			# 		width = options[:width]
			# 		height = options[:height]
			# 		frameborder = options[:frameborder]
			# 		wmode = options[:wmode]
			# 		autoplay = options[:autoplay]
			# 		hide_related = options[:hide_related]
			# 		src = "//www.youtube.com/embed/#{youtube_id}"
			# 		params = []
			# 		params << "wmode=#{wmode}" if wmode
			# 		params << "autoplay=1" if autoplay
			# 		params << "rel=0" if hide_related
			# 		src += "?#{params.join '&'}" unless params.empty?
			# 		%{<div class="video youtube"><iframe width="#{width}" height="#{height}" src="#{src}" frameborder="#{frameborder}" allowfullscreen></iframe></div>}
			# 	end
			# end
		# end	
	end

	def get_venue_and_company(role)
		venue = role.production_current_venue
		company = role.production_company
		if venue.present? && company.present?
       		link_to(role.production_current_venue_name,venue_path(venue.id),:target=>"_blank") +" - " +link_to(role.production_company_name,company_path(company.id),:target=>"_blank")
        elsif role.production_current_venue.present?  
            link_to(role.production_current_venue_name,venue_path(venue.id),:target=>"_blank")
        else
           link_to(role.production_company_name,company_path(company.id),:target=>"_blank")
        end
               
	end	

	def show_image(resume)
		if resume.resume_type == 'Performing Artist'
			if resume.image.file?
	          image_tag resume.image.try(:url),:style=>"width: 250px;"
	        else
	          content_tag(:div,:class=>"resume_attribute") do	
	          	render 'resumes/show_contact_info',:@resume=>resume		
	          end	
	        end	
	    end
	        
	end	

	def show_attribute(resume)
		if resume.resume_type == 'Performing Artist'
			 render 'resumes/show_attribute',:@resume=>resume
		elsif resume.resume_type == 'Production Member' || resume.resume_type == 'Director'
			if resume.image.file?
			 render 'resumes/show_contact_info',:@resume=>resume
			end 	
		end	
	end	


    def get_title_row_class(index)
    	index == 0 ? "col-xs-2 diminished-font m-bottom-20" : "col-xs-2"
    end

    def get_title_row_bold(index)
    	index == 0 ? "bold_col" : ""
    end	

end
