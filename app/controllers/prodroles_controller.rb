# class RolesController < ApplicationController
#   before_action :set_role, only: [:show, :edit, :update, :destroy]
#   before_action :new_production, only: [:edit, :new, :create]
#   before_action :new_venue, only: [:edit, :new, :create]
#   before_action :new_company, only: [:edit, :new, :create]
#
#   def index
#     @resume = find_resume
#     @roles = Role.where(resume_id: @resume.id)
#   end
#
#   def show
#   end
#
#   def new
#     @role = Role.new
#     @resume = find_resume
#     @role.resume = @resume
#   end
#
#   def edit
#     @production = @role.production
#   end
#
#   def create
#     @role = Role.new(role_params)
#     @resume = @role.resume
#
#     respond_to do |format|
#       if @role.save
#         format.html { redirect_to @resume, notice: 'Role was successfully created.' }
#         format.json { render :role, status: :created, location: @role }
#       else
#         format.html { render :new }
#         format.json { render json: @role.errors, status: :unprocessable_entity }
#       end
#     end
#   end
#
#   def update
#     @resume = @role.resume
#     respond_to do |format|
#       if @role.update(role_params)
#         format.html { redirect_to @resume, notice: 'Show was successfully updated.' }
#         format.json { render :show, status: :ok, location: @role }
#       else
#         format.html { render :edit }
#         format.json { render json: @role.errors, status: :unprocessable_entity }
#       end
#     end
#   end
#
#
#   private
#   # Use callbacks to share common setup or constraints between actions.
#   def set_role
#     @role = Role.find(params[:id])
#     @resume = @role.resume
#   end
#
#   # Never trust parameters from the scary internet, only allow the white list through.
#   def role_params
#     params.require(:role).permit(:production_id, :resume_id, :name)
#   end
#
#   def find_resume
#     #TODO: use current_user to validate
#     Resume.find params[:resume_id]
#   end
# end
#
# def destroy
#   @role.destroy
#   respond_to do |format|
#     format.html { redirect_to @resume, notice: 'Show was successfully destroyed.' }
#     format.json { head :no_content }
#   end
# end
#
#
#
# private
#
# def new_production
#   @production = Production.new
#   @production.shows.build
#   puts "CREATED PRODUCTION: #{@production.to_json}"
# end
#
# def new_venue
#   @venue = Venue.new
# end
#
# def new_company
#   @company = Company.new
# end