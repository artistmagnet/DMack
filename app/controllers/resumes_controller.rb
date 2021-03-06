class ResumesController < ApplicationController
  respond_to :html, :js,:json
  before_filter :authenticate_user!  

  # before_action :check_if_member, only: [:new]

  before_action :new_resume, only: [:new]
  before_action :set_resume, only: [:email_resume,:show, :edit, :edit_with_role, :update, :destroy, :add_table, :destroy_table]
  #before_action :new_production, only: [:new, :edit, :edit_with_role, :create]
  

  before_action :new_show, only: [:new, :edit, :edit_with_role]
  before_action :new_venue, only: [:edit, :edit_with_role, :new, :create]
  before_action :new_company, only: [:edit, :edit_with_role, :new, :create]
  before_action :load_data,only: [:new,:edit]
  skip_before_filter :verify_authenticity_token  
  #before_action :initialize_images_session ,only: [:new,:edit]
  before_action :new_production, only: [:edit_with_role,:new,:edit]
  before_action :set_role, only: [:edit_with_role]
  # before_action :set_production,  only: [:edit_with_role]
  # before_action :set_show,        only: [:edit_with_role]
  # before_action :set_company,     only: [:edit_with_role]
  # before_action :set_venue,       only: [:edit_with_role]

  #before_action :new_director_invitation, only: [:edit, :edit_with_role, :new]
  before_action :new_director_invitation, only: [ :edit_with_role,:new,:edit]
 

  after_action :destroy_other, only: [:update]

  def index
    #@resumes = Resume.all.order(:id)
    @resumes = current_user.resumes
  end

  def check_if_member

    puts "Hi"
    return_path = new_order_url
    if current_user.subscription.nil? && current_user.resumes.count > 0
	   # redirect_to '/resumes/account_tier'
     values = {
         business: "merchant@gotealeaf.com",
         upload: 1,
         no_shipping: 1,
         return: "#{Rails.application.secrets.app_host}#{return_path}",
         notify_url: "http://our_ngrok_url/hook",
         invoice: "id",
         item_name: "Upgrade Your Account"
     }
     values =    values.merge(
                     cmd: "_xclick-subscriptions",
                     a3: 9.99,
                     p3: 1,
                     srt: 2,
                     t3: "M"
                 )
               # else
               #   values.merge(
               #       cmd: "_xclick",
               #       amount: "course.price",
               #       item_number: "course.id",
               #       quantity: '1'
               #   )
               # end
     redirect_to "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
    end 

  end

  def new
    if current_user.subscription || current_user.resumes.count < 1
      $session_image_id,$session_video_id,$session_role = [],[],[] 
      @videos = current_user.videos
      @roles = current_user.roles.where(:resume_id=>nil)
      @resume_educations_rows = @resume.educations
      @resume_educations_header_size = @resume_educations_rows.first.ecolumns.size
      @resume_customs_rows = @resume.customs
      @resume_customs_header_size = @resume_customs_rows.first.ccolumns.size
    else
      redirect_to "/resumes/account_tier"
    end
  end

  def paypal_url(return_path)
      values = {
          business: "merchant@gotealeaf.com",
          upload: 1,
          no_shipping: 1,
          return: "#{Rails.application.secrets.app_host}#{return_path}",
          notify_url: "http://our_ngrok_url/hook",
          invoice: "id",
          item_name: "Upgrade Your Account"
      }
      values =    values.merge(
                      cmd: "_xclick-subscriptions",
                      a3: 9.99,
                      p3: 1,
                      srt: 2,
                      t3: "M"
                  )
                # else
                #   values.merge(
                #       cmd: "_xclick",
                #       amount: "course.price",
                #       item_number: "course.id",
                #       quantity: '1'
                #   )
                # end
      "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
    end

  def edit    
    @role = @resume.roles.build
    @resume.representations.build unless @resume.representations.present?
    @resume.skills.build unless @resume.skills.present?
    @resume.others.build unless @resume.others.present?
    @resume.build_resume_attribute unless @resume.resume_attribute.present?
    @sections = Array.new(5)  { @resume.resume_sections.build } unless @resume.resume_sections.present? 
    @roles = @resume.roles
    @custom = Custom.find_by(:resume_id => params[:id])
    @section_order=@resume.resume_sections.last(5).collect(&:section_id)
    @sections = @resume.resume_sections
    @sections = @sections.order(:position)
    $session_image_id =[]   
    @videos = @resume.videos
    @resume_educations_rows = @resume.educations.ordered
    @resume_educations_header_size = @resume.educations.header.ecolumns.size
    @resume_customs_rows = @resume.customs.ordered
    @resume_customs_header_size = @resume.customs.header.ccolumns.size
  end

  def edit_with_role
  end

  def show
    @section_slots = SectionSlot.order(:position)
    @sections = @resume.resume_sections.order(:position)
  end

  def create
    @resume = Resume.new(resume_params)    
    @resume.columns = params[:column]
    @resume.positions = params[:positions]
    @resume.custom_cols = params[:custom_cols]
    @resume.custom_pos = params[:custom_pos]
    @resume.repr_cols = params[:repr_cols]
    @resume.repr_pos = params[:repr_pos]
    @resume.user ||= current_user

    
    respond_to do |format|
      if @resume.save
        update_role(@resume)
        update_photo(@resume)
        update_video(@resume)
 
	if params[:resume][:resume_type] === "Director"
		d= Director.new(:resume_id => @resume.id, :email => params[:resume][:contact_info_attributes][:email], :name => params[:resume][:contact_info_attributes][:nick_name], :text_only => false)
		d.save
	end
 
	if params[:serialized]
        	str = params[:serialized].scan(/\d/).join(',')
        	new_order=str.split(",").map(&:to_i)
        	old_order = ResumeSection.where(:resume_id => params[:id])
        	new_order.each.with_index do |nu, i|
			old_order.each do |oo|
				if oo.section_id == nu
					oo.position = i + 1
					oo.save
					break;
				end
			end
		end	
  	end
	@render = params[:resume][:save_option].eql?('Save') ? edit_resume_path(@resume) : resume_path(@resume)
        format.html { redirect_to @render, notice: 'Resume was succesfully created'}
        format.json { render json: @resume}
      else
        format.html { render :new }
        format.json { render json: @resume.errors.full_messages, status: :unprocessable_entity}
      end
    end
  end

  def page_view
    
  end

  def update
    @resume.columns = params[:column]
    @resume.positions = params[:positions]
    @resume.custom_cols = params[:custom_cols]
    @resume.custom_pos = params[:custom_pos]
    @resume.repr_cols = params[:repr_cols]
    @resume.repr_pos = params[:repr_pos]
        
    respond_to do |format|
      if @resume.update(resume_params)
        # @resume.education_columns = params[:columns]
   	# delete Attributes and Skills for this resume if saved as Director or Production Member
	if @resume.resume_type === "Production Member" || @resume.resume_type === "Director"	
	      	Attribute.destroy_all(:resume_id => @resume.id)
		Skill.destroy_all(:resume_id => @resume.id)
	end
	director = Director.find_by(:resume_id => @resume.id)
	if @resume.resume_type != "Director" && director
		director.update_attributes(:text_only => true)
	else
		if director.nil?
			contact_info = ContactInfo.find_by(:resume_id => @resume.id)
			director = Director.new(:resume_id => @resume.id, :email => current_user.email, :first_name => contact_info.first_name, :last_name => contact_info.last_name, :name => "#{contact_info.first_name} #{contact_info.last_name}", :text_only => false)
			director.save
		else
			director.update_attributes(:text_only => false)
		end
	end 
	update_role(@resume)
        update_photo(@resume)
        update_video(@resume)
   
	if params[:serialized]
		str = params[:serialized].scan(/\d/).join(',')
    		new_order=str.split(",").map(&:to_i)
    		old_order = ResumeSection.where(:resume_id => params[:id])
    		new_order.each.with_index do |nu, i|
        		old_order.each do |oo|
				if oo.section_id == nu
					oo.position = i + 1
					oo.save
					break;		
				end
 			end
    		end
	end

   	if params[:commit] == 'Save' || params[:commit] == 'Continue'
  		format.html { redirect_to edit_resume_path(@resume), notice: 'Resume was succesfully Updated'}
	else
		format.html { redirect_to resume_path(@resume), notice: 'Resume was succesfully Updated'}
	end
        format.json { render json: @resume }
      else
        format.html { render :edit }
        format.json { render json: @resume.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  def destroy_other
    if params[:resume][:others_attributes]
      params[:resume].require(:others_attributes).each do |oth|
        if oth[1][:id].present?
          @oth=Other.find(oth[1][:id])
          @oth.destroy if @oth.content.blank?
        end
      end
    end
  end

  def find_user_role
    @status=current_user.status
    # @status=current_user.role.present?
    respond_to do |format|
      format.json { render json: @status }
    end
  end

  def account_tier
    
  end

  def new_theatre
    params[:new_theatre]=Hash[params.map{|u,v|[u,v]}]
    @theatre=Theatre.new(new_theatre_params)
    @id=params[:theatre_id]
    respond_to do |format|      
      format.js      
    end
  end

  def destroy
    @resume.delete
    respond_to do |format|
      format.html { redirect_to resumes_url, notice: 'Resume was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def add_table
    @resume.add_rtable
    redirect_to @resume
  end

  def destroy_table
    table = Rtable.find(params[:table_id])
    table.destroy
    redirect_to @resume
  end

  def upload    
    @image = current_user.photos.create(:image=> params[:file])
    # Photo.new(:image=> params[:file])
    # @image.save 
    $session_image_id << @image.id    
    # respond_to do |format|
    #   format.js
    # end
  end

  def autosuggest
    @productions = Production.where("name like ?", "%#{params[:name]}%")
    respond_to do |format|
        format.json {render :json => @productions}
    end
  end

  def email_resume
    UserMailer.email_resume(current_user, @resume).deliver
    flash[:notice]= "Resume has been sent in your email #{current_user.email}"
    redirect_to :back
  end

  def view_resume_pdf
    @resume = Resume.find(params[:id])
    respond_to do |format|
    #   format.html
    #   format.pdf do
    #     render :pdf => "../resumes/view_resume_pdf.erb"
    #   end

      format.pdf do
      render :pdf => "my_pdf_name.pdf",
      :disposition => "inline",
      :template => "resumes/view_resume_pdf.pdf.erb",
      :layout => false
      end       
       format.html
    end
  end
  def download_pdf
    @resume = Resume.find(params[:id])
    # html = render_to_string(:action => '../resumes/view_resume_pdf.pdf.erb',:layout=>false)
    # html = render_to_string(:action => '../resumes/show_resume_pdf.pdf.erb',:layout=>false)
    #pdf = PDFKit.new(html,:page_size => 'Letter', :orientation => 'Landscape')
    #pdf = WickedPdf.new.pdf_from_string(html)
    # html = render_to_string(action: "show_resume_pdf.pdf.erb", layout: 'application',:format=>)
    # @pdf = PDFKit.new(html,:page_size => 'Letter', :orientation => 'Landscape')
    @pdf  = PDFKit.new(render_to_string handlers: [:erb], formats: [:html], template: "/resumes/show_resume_pdf.pdf.erb")
    @pdf.stylesheets << "#{Rails.root}/app/assets/stylesheets/templates/layouts.css"
    @pdf.stylesheets << "#{Rails.root}/app/assets/stylesheets/templates/main.css"
    @pdf.stylesheets << "#{Rails.root}/app/assets/stylesheets/templates/custom.css"
    @pdf.stylesheets << "#{Rails.root}/app/assets/stylesheets/templates/bootstrap.min.css"
    @pdf.stylesheets << "#{Rails.root}/app/assets/stylesheets/resumes.css"

    send_data(@pdf.to_pdf,:filename => "#{@resume.resume_name}.pdf", :type => 'application/pdf')  
    #file = pdf.to_file('/public')
  end

  def sort_sections
    # debugger
  end
  
  def add_videos
    # @resume = Resume.find(params[:video][:resume_id])
    # @resume.videos.create(video_params)
    # @videos = @resume.videos
    if current_user
      @video = current_user.videos.create(video_params)
      $session_video_id << @video.id  
      if @video.save
        @videos = current_user.videos
        respond_to :js
      end
    end     
  end 

  def remove_video
    @video = Video.find(params[:id])
    @video.destroy
    @videos = current_user.videos
    respond_to do |format|
      format.js{render :add_videos}
    end   
  end 

  def create_role
    @role = current_user.roles.create(role_params)
    $session_role << @role
    @roles = current_user.roles
    respond_to do |format|
      if @role.save!
        # format.html { redirect_to after_create_path(request, @role), notice: 'Role was successfully created.' }
        format.json { render json: @role }
        format.js 
      else
        # format.html { render action: 'new' }
        format.json { render json: @role.errors.full_messages, status: :unprocessable_entity }
        format.js { render json: @role.errors.full_messages, status: :unprocessable_entity }
      end  

    end
  end  

  private
  # Use c
  # allbacks to share common setup or constraints between actions.
  def new_resume
    #@resume = Resume.create(user: current_user)
    @resume = Resume.new
    @role = @resume.roles.build
    @resume.build_contact_info
    @resume.build_resume_attribute
    @sections = []
    ['Representation','Education/Training','Skills','Custom','Other'].each do |s|
      @section = ResumeSection.new
      @section.section_name = s
      @sections << @section
    end  
    @resume.photos.build
    @resume.theatres.build
    @resume.educations.build(ecolumns: ["Institution", "City", "State/Region", "Country", "Degree/Concentration", "Year"], is_bold: true)
    @resume.educations.build
    @resume.rtables.build
    @resume.representations.build
    @resume.skills.build
    @resume.others.build
    @resume.customs.build(ccolumns: Array.new(4, "Enter Custom Title"), is_bold: true)
    @resume.customs.build
    @resume.videos.build
  end

  def set_resume
    if params[:id] =~ /\A[-+]?[0-9]+\z/
      @resume = Resume.find(params[:id])
    else
      @resume = Resume.find_by(:custom_url => params[:id])
    end
  end

  def new_theatre_params
    params.require(:new_theatre).permit(:production,:role,:venue,:company,:directed_by,:location,:performance_date)  
  end

  def new_production
    @production = Production.new(id:0)
    @production.build_photo
    @production.shows.build
    @production.director_invitations.build
    # @production.artist_invitations.build
  end

  def set_role
    @role = Role.find id_params[:role_id]
  end

  # def set_production
  #   @production = @role.production
  # end

  # def set_company
  #   @company = @production.company || Company.new
  # end

  # def set_venue
  #   @venue = @show.venue || Venue.new
  # end

  def new_show
    # puts 'CREATING SHOW (resCtrl)'
    @show = Show.new(:production => @production)
  end

  # def set_show
  #   # puts 'SETTING SHOW (resCtrl)'
  #   @show = @production.opening_show #|| Show.new(:production => @production)
  # end

  def new_venue
    @venue = Venue.new
    @venue.build_photo
  end

  def new_company
    @company = Company.new
    @company.build_photo
  end

  def new_director_invitation
    #@invitation = @production.director_invitations.build(by: @resume.user)
    @invitation = @production.director_invitations.build(by: current_user)
  end

  # def add_education_table(resume)
  #   table = EducationTable.create(title: 'Education', columns: '{School,City,State,Country,Degree,Year}', positions: '{1,2,3,4,5,6}')
  #   SectionSlot.create(section_id: table.id, section_type: 'Rtable', resume_id: resume.id, position: 1)
  # end

  # Never trust parameters from the scary internet, only allow the white list through.
  def resume_params
    params.require(:resume).permit(:performer_type,:union_guild,:image,:role_id,:resume_type,:resume_name,:other,:skills,:custom_url,
      roles_attributes: [:id, :production_id, :resume_id, :name, :_destroy],
      contact_info_attributes: [:id,:position,:nick_name,:first_name,:middle_name,:last_name,:suffix,:street_address1,:street_address2,:city,:state,:zip_code,:phone1,:phone2,:email,:website,:facebook,:twitter,:linkedin,:country,:_destroy],
      photos_attributes: [:id,:position, :image, :_destroy],
      theatres_attributes: [:id, :production_id,:production,:venue,:company,:venue_id,:company_id,:role,:director_id,:directed_by,:position,:performance_date,:location, :_destroy],
      educations_attributes: [:id,:position, :school,:city,:state,:country,:degree,:year,:is_bold,:_destroy,:ecolumns=>[]],
      representations_attributes: [:id,:position,:_destroy,:rcolumns],
      skills_attributes: [:id, :category_id,:skills,:position, :_destroy],
      resume_attribute_attributes: [:id,:position, :height,:weighr,:gender,:age,:hair_color,:hair_lenght,:street_address2,:weight,:eye_color,:vocal_range,:ethnicity, :_destroy],
      customs_attributes: [:id, :custom1, :custom2, :custom3, :custom4, :custom5, :custom6, :position, :resume_id,:is_bold, :_destroy,:ccolumns=>[]], 
      others_attributes: [:id, :content, :position, :_destroy], 
      resume_sections_attributes: [:id, :position, :section_id,:section_name,:_destroy],
      rtables_attributes: [:id,:columns,:columns=>[],:positions=>[]])
  end

  def initialize_images_session
    # session[:image_ids]=[]
  end

  def id_params
    params.permit(:id, :role_id)
  end

  def update_photo(resume)
    
    if !params[:photos].blank?
      resume.photos.destroy_all
      params[:photos].each_with_index do |photo,index|       
        resume.photos.create(:image=>photo,:user_id=>current_user.id) if !params[:removed_images].include? index.to_s
      end
    end
    # debugger
    if $session_image_id.present?
      $session_image_id.compact.each_with_index do |id,index|        
        photo = Photo.find(id)
        photo.update_attributes(:resume_id=>resume.id,:user_id=>current_user.id) if !params[:removed_drag_images].include? (index+1).to_s
     end
      $session_image_id=nil
    end
    current_user.photos.where(:resume_id=>nil).destroy_all
  
  end
  def update_video(resume)
    # if !params[:videos].blank?
    #   resume.videos.destroy_all
    #   params[:videos].each_with_index do |video,index|       
    #     resume.videos.create(:video_url=>video,:user_id=>current_user.id) if !params[:removed_images].include? index.to_s
    #   end
    # end
    # debugger
    if $session_video_id.present?
      $session_video_id.compact.each_with_index do |id,index|        
        video = Video.find(id)
        video.update_attributes(:resume_id=>resume.id,:user_id=>current_user.id) 
      end
      $session_video_id=nil
    end
    current_user.videos.where(:resume_id=>nil).destroy_all
  end

  def update_role(resume)
    if $session_role.present?
      $session_role.compact.each do |role|        
        # role = Role.find(role.id)
        role.update_attribute(:resume_id,resume.id) 
      end
      $session_role=nil
    end
    Role.where(:resume_id=>nil).destroy_all
  end

  def load_data
    @productions_name = Production.all.flatten.map{ |u| {value: u.id, label: u.name}}
    # @productions_name = Production.all.collect(&:name)
    @venues_name = Venue.all.collect(&:name).flatten
    @companies_name = Company.all.collect(&:name).flatten
    @directors_name = Director.all.collect(&:name).flatten
  end

  def video_params
    params.require(:video).permit(:id,:resume_id,:video_url,:user_id)
  end 

  def after_create_path(request, role)
    request.path == production_roles_path(role.production) ? production_artist_invitations_path(role.production) : request.path
  end

  def role_params
    params.require(:role).permit(:production_id,:director_id,:resume_id, :name, :dirname,:diremail,:user_id)
  end

end
