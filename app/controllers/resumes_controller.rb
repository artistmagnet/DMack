class ResumesController < ApplicationController
  respond_to :html, :js,:json
  before_filter :authenticate_user!  

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

  def new
    $session_image_id,$session_video_id,$session_role = [],[],[] 
    @videos = current_user.videos
    @roles = current_user.roles.where(:resume_id=>nil)
  end

  def edit    
    @role = @resume.roles.build
    @roles = @resume.roles
    @section_order=@resume.resume_sections.last(5).collect(&:section_id)
    @sections = @resume.resume_sections
    $session_image_id =[]   
    @videos = @resume.videos
  end

  def edit_with_role
  end

  def show
    @section_slots = SectionSlot.order(:position)
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
        # add_education_table(@resume)  #moved to model
        # format.html { redirect_to edit_resume_path(@resume), notice: 'Resume was succesfully created'}
        # format.html { render "/resumes/page_view.html.erb", notice: 'Resume was succesfully created'}
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
        update_role(@resume)
        update_photo(@resume)
        update_video(@resume)
        # format.html { redirect_to edit_resume_path(@resume), notice: 'Updated' }
        @action = params[:commit] == 'Save' ? 'edit' : 'show'
        format.html { render @action, notice: 'Resume was succesfully Updated'}
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
    html = render_to_string(:action => '../resumes/view_resume_pdf.pdf.erb',:layout=>false)
    #pdf = PDFKit.new(html,:page_size => 'Letter', :orientation => 'Landscape')
    pdf = WickedPdf.new.pdf_from_string(html)
    send_data(pdf,:filename => "#{current_user.name}.pdf", :type => 'application/pdf')  
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
    
    @resume.photos.build
    @resume.theatres.build
    @resume.educations.build
    @resume.rtables.build
    @resume.representations.build
    @resume.skills.build
    @resume.others.build
    @resume.customs.build
    @resume.videos.build
  end

  def set_resume
    @resume = Resume.find(params[:id])
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
    params.require(:resume).permit(:performer_type,:union_guild,:image,:role_id,:resume_type,:resume_name,:other,:skills, 
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
