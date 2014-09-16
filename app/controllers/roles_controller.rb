class RolesController < InheritedResources::Base
  before_action :set_role, only: [:show, :edit, :update, :destroy]

  def index
    @resume = find_resume
    @roles = Role.where(resume_id: @resume.id)
  end

  def show
  end

  def new
    @role = Role.new
    @resume = find_resume
    @role.resume = @resume
  end

  def edit
  end

  def create
    @role = Role.new(role_params)
    @resume = @role.resume

    respond_to do |format|
      if @role.save
        format.html { redirect_to @resume, notice: 'Role was successfully created.' }
        format.json { render :role, status: :created, location: @role }
      else
        format.html { render :new }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @resume = @role.resume
    respond_to do |format|
      if @role.update(role_params)
        format.html { redirect_to @resume, notice: 'Show was successfully updated.' }
        format.json { render :show, status: :ok, location: @role }
      else
        format.html { render :edit }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
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
    params.require(:role).permit(:production_id, :resume_id, :name)
  end

  def find_resume
    #TODO: use current_user to validate
    Resume.find params[:resume_id]
  end
end

def destroy
  @role.destroy

  redirect_to @resume, notice: 'Show was successfully destroyed.'

  # respond_to do |format|
  #   format.html { redirect_to @resume, notice: 'Show was successfully destroyed.' }
  #   format.json { head :no_content }
  # end
end