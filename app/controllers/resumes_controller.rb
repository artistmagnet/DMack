class ResumesController < InheritedResources::Base
  before_action :set_resume, only: [:show, :edit, :update, :destroy]
  before_action :new_production, only: [:edit, :new, :create]
  before_action :new_venue, only: [:edit, :new, :create]
  before_action :new_company, only: [:edit, :new, :create]

  def index
    @resumes = Resume.all.order(:name)
  end

  def new
    @resume = Resume.new
    @resume.roles.build
  end

  def show
  end

  def create
    @resume = Resume.new(resume_params)

    respond_to do |format|
      if @resume.save
        format.html { redirect_to @resume, notice: 'Resume was succesfully created'}
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
        format.html { redirect_to @resume, notice: 'Resume was successfully updated.' }
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
  # Use callbacks to share common setup or constraints between actions.
  def set_resume
    @resume = Resume.find(params[:id])
  end

  def new_production
    @production = Production.new
    @production.shows.build
  end

  def new_venue
    @venue = Venue.new
  end

  def new_company
    @company = Company.new
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def resume_params
    params.require(:resume).permit(roles_attributes: [:id, :production_id, :resume_id, :name, :_destroy])
  end

end
