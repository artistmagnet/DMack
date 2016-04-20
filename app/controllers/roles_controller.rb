class RolesController < ApplicationController
  before_action :set_role, only: [:show, :edit, :update, :destroy]
  #before_action :new_production, only: [:edit]
  before_action :new_venue, only: [:edit]
  before_action :new_company, only: [:edit]

  def index
    role_params = {}
    role_params[:resume_id] = params[:resume_id]
    role_params[:production_id] = params[:production_id]
    @roles = Role.where(role_params)
  end

  def show
  end

  def new
    @role = Role.new
    @resume = find_resume
    @role.resume = @resume
  end

  def edit
    # @production = @role.production
    # @invitation = @production.director_invitations.build(by: current_user)
    # @show = Show.find_by_production_id(@production.id)
    # @venue = Venue.find(@show.venue_id)
    # @company = Company.find(@production.company_id)
    @production = Production.new(id:0)
    @production.build_photo
    @production.shows.build
    @production.director_invitations.build
    @show = Show.new(:production => @production)
    @venue = Venue.new
    @venue.build_photo
    @company = Company.new
    @company.build_photo
    @invitation = @production.director_invitations.build(by: current_user)
  end

  def create
    @role = current_user.roles.build(role_params)
    d = Director.find_by(:id => @role.director_id)
    if d.nil?
      d = Director.new(:name => @role.dirname)
      d.save
    end 
    #@session_roles = $session_role << @role
    respond_to do |format|
      if @role.save
         @roles = current_user.roles.where(:resume_id=>nil)
      #  format.html { redirect_to after_create_path(request, @role), notice: 'Role was successfully created.' }
      #  format.json { render json: @role }
        format.js
      else
      #  format.html { render :new }
      #  format.json { render json: @role.errors.full_messages, status: :unprocessable_entity }
        format.js{ render json: @role.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @role.update(role_params)
        format.html { redirect_to new_resume_path, notice: 'Show was successfully updated.' }
        format.json { render json: @role }
        format.js {render :js => "window.location.href = '"+new_resume_path+"'"}
      else
        format.html { render :edit, json: @role.errors.full_messages }
        format.json { render json: @role.errors.full_messages, status: :unprocessable_entity }
        format.js { render json: @role.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @role.destroy
    respond_to do |format|
      puts "referer: #{request.referer}"
      format.html { redirect_to request.referer, notice: 'Show was successfully destroyed.' }
      # format.html { redirect_to @resume, notice: 'Show was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private
  # Use callbacks to share common setup or constraints between actions.
  def set_role
    @role = Role.find(params[:id])
    @resume = @role.resume
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def role_params
    params.require(:role).permit(:production_id, :resume_id, :name, :dirname,:director_id)
  end

  def find_resume
    #TODO: use current_user to validate
    Resume.find params[:resume_id]
  end

  def after_create_path(request, role)
    request.path == production_roles_path(role.production) ? production_artist_invitations_path(role.production) : request.path
  end

end



def new_production
  @production = Production.new
  @production.shows.build
  puts "CREATED PRODUCTION: #{@production.to_json}"
end

def new_venue
  @venue = Venue.new
end

def new_company
  @company = Company.new
end
