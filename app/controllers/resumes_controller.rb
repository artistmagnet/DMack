class ResumesController < ApplicationController
  before_action :new_resume, only: [:new]
  before_action :set_resume, only: [:show, :edit, :edit_with_role, :update, :destroy]
  before_action :new_production, only: [:new, :edit, :create]
  before_action :new_show, only: [:new, :edit]
  before_action :new_venue, only: [:edit, :new, :create]
  before_action :new_company, only: [:edit, :new, :create]

  before_action :set_role,        only: [:edit_with_role]
  before_action :set_production,  only: [:edit_with_role]
  before_action :set_show,        only: [:edit_with_role]
  before_action :set_company,     only: [:edit_with_role]
  before_action :set_venue,       only: [:edit_with_role]

  before_action :new_director_invitation, only: [:edit, :edit_with_role, :new]

  def index
    @resumes = Resume.all.order(:id)
  end

  def new
  end

  def edit
    @role = @resume.roles.build
  end

  def edit_with_role
  end

  def show
    @section_slots = SectionSlot.order(:position)
  end

  def create
    @resume = Resume.new(resume_params)
    @resume.user ||= current_user

    respond_to do |format|
      if @resume.save
        format.html { redirect_to edit_resume_path(@resume), notice: 'Resume was succesfully created'}
        format.json { render json: @resume}
      else
        format.html { render :new }
        format.json { render json: @resume.errors.full_messages, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @resume.update(resume_params)
        format.html { redirect_to edit_resume_path(@resume), notice: 'Updated' }
        format.json { render json: @resume }
      else
        format.html { render :edit }
        format.json { render json: @resume.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @resume.destroy
    respond_to do |format|
      format.html { redirect_to resumes_url, notice: 'Resume was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private
  # Use c
  # allbacks to share common setup or constraints between actions.
  def new_resume
    @resume = Resume.create(user: current_user)
    @role = @resume.roles.build
  end

  def set_resume
    @resume = Resume.find(params[:id])
  end

  def new_production
    @production = Production.new(id:0)
    @production.shows.build
    @production.director_invitations.build
    # @production.artist_invitations.build
  end

  def set_role
    @role = Role.find id_params[:role_id]
  end

  def set_production
    @production = @role.production
  end

  def set_company
    @company = @production.company || Company.new
  end

  def set_venue
    @venue = @show.venue || Venue.new
  end

  def new_show
    # puts 'CREATING SHOW (resCtrl)'
    @show = Show.new(:production => @production)
  end

  def set_show
    # puts 'SETTING SHOW (resCtrl)'
    @show = @production.opening_show #|| Show.new(:production => @production)
  end

  def new_venue
    @venue = Venue.new
  end

  def new_company
    @company = Company.new
  end

  def new_director_invitation
    @invitation = @production.director_invitations.build(by: @resume.user)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def resume_params
    params.require(:resume).permit(:role_id, roles_attributes: [:id, :production_id, :resume_id, :name, :_destroy])
  end

  def id_params
    params.permit(:id, :role_id)
  end

end
