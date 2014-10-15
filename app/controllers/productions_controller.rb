class ProductionsController < ApplicationController
  before_action :set_production, only: [:show, :edit, :update, :destroy]
  before_action :new_venue, only: [:edit, :new, :create]
  before_action :new_company, only: [:edit, :new, :create]

  # GET /productions
  # GET /productions.json
  def index
    @productions = Production.all.order(:name)
  end

  # GET /productions/1
  # GET /productions/1.json
  def show
  end

  # GET /productions/new
  def new
    @production = Production.new
    @production.shows.build
    @production.invitations.build
  end

  # GET /productions/1/edit
  def edit
    @production.invitations.build if @production.invitations.empty?
  end

  # POST /productions
  # POST /productions.json
  def create
    @production = Production.new(production_params)

    respond_to do |format|
      if @production.save
        manage_temp_director_info(@production)
        format.html { redirect_to @production, notice: 'Production was successfully created.' }
        format.json { render json: @production }
      else
        format.html { render :new }
        format.json { render json: @production.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /productions/1
  # PATCH/PUT /productions/1.json
  def update
    respond_to do |format|
      if @production.update(production_params)
        manage_temp_director_info(@production)
        format.html { redirect_to @production, notice: 'Production was successfully updated.' }
        format.json { render json: @production }
      else
        format.html { render :edit }
        format.json { render json: @production.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /productions/1
  # DELETE /productions/1.json
  def destroy
    @production.destroy
    respond_to do |format|
      format.html { redirect_to productions_url, notice: 'Production was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_production
    @production = Production.find(params[:id])
  end

  def new_venue
    @venue = Venue.new
  end

  def new_company
    @company = Company.new
  end

  # def new_invitation
  #   @invitation = invitation.new(to: @production)
  # end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def production_params
    params.require(:production).permit(:name, :description, :company_id, :director_id, :dirname, :diremail,
                                       shows_attributes: [:id, :production_id, :venue_id, :date, :_destroy],
                                       invitations_attributes: [:id, :first_name, :last_name, :email])
  end

  def manage_temp_director_info(production)
    if production.director.nil? && !production.dirname.blank? && !production.diremail.blank?
      AmMailer.invite_director(production.dirname, production.diremail, 'An Artist Magnet user').deliver
    else
      production.dirname = ''
    end
    production.diremail = ''
  end
end
