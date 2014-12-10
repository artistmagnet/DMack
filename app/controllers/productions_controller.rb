class ProductionsController < ApplicationController
  before_action :set_date_params, only: [:create, :update]
  before_action :set_production, only: [:show, :edit, :update, :destroy]
  before_action :new_show, only: [:new]
  before_action :set_show, only: [:edit]
  before_action :new_venue, only: [:edit, :new, :create, :update]
  before_action :new_company, only: [:edit, :new, :create, :update]

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
    # @production.director_invitations.build
  end

  # GET /productions/1/edit
  def edit
  end

  # POST /productions
  # POST /productions.json
  def create
    @production = Production.new(production_params)
    # if (@show = @production.opening_show).nil?
    #   @production.shows.build
    #   @show = @production.shows.first
    # end

    respond_to do |format|
      if @production.save
        #TO DO: save current user
        # @production.set_director_inviter User.first
        # send_director_invitation(@production)
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
    # previous_emails = Invitation.emails
    respond_to do |format|
      if @production.update(production_params)
        puts "UPDATING PROD! " +  production_params.to_json
        #TODO filter by inviter too
        # send_director_invitation(@production) if (!previous_emails.include? @production.last_director_invitation.email)
        format.html { redirect_to @production, notice: 'Production was successfully updated.' }
        format.json { render json: @production }
      else
        format.html { redirect_to edit_production_path(@production), notice: 'not saved' }
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

  def update_director
    @production = Production.find params[:production_id]
    respond_to do |format|
      if @production.update(params.require(:production).permit(:director_id) )
        format.html { redirect_to production_director_invitations_path(@production), notice: "Saved" }
        format.json { render json: @production }
      else
        format.html { redirect_to production_director_invitations_path(@production), notice: 'not saved' }
        format.json { render json: @production.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_production
    @production = Production.find(params[:id])
  end

  def new_show
    # puts 'CREATING SHOW (prodCtrl)'
    @show = Show.new(:production => @production)
  end

  def set_show
    # puts 'SETTING SHOW (prodCtrl)'
    @show = @production.opening_show #|| Show.new(:production => @production)
  end

  def new_venue
    @venue = Venue.new
  end

  def new_company
    @company = Company.new
  end

  def set_date_params
    # puts "PARAMS ---------------------------"
    puts params[:production][:shows_attributes][:"0"][:"date(1i)"]
    puts params[:production][:shows_attributes][:"0"][:"date(2i)"]
    puts params[:production][:shows_attributes][:"0"][:"date(3i)"]
    params[:production][:shows_attributes][:"0"][:opening_date_mask] = partial_date_mask(
      params[:production][:shows_attributes][:"0"][:"date(1i)"],
      params[:production][:shows_attributes][:"0"][:"date(2i)"],
      params[:production][:shows_attributes][:"0"][:"date(3i)"]
    )
    params[:production][:shows_attributes][:"0"][:"date(2i)"] = partial_date_month(
      params[:production][:shows_attributes][:"0"][:"date(1i)"],
      params[:production][:shows_attributes][:"0"][:"date(2i)"],
      params[:production][:shows_attributes][:"0"][:"date(3i)"]
    )
    params[:production][:shows_attributes][:"0"][:"date(3i)"] = partial_date_day(
      params[:production][:shows_attributes][:"0"][:"date(1i)"],
      params[:production][:shows_attributes][:"0"][:"date(2i)"],
      params[:production][:shows_attributes][:"0"][:"date(3i)"]
    )
  end

  def partial_date_month(year_param, month_param, day_param)
    (year_param != '' && month_param == '') ? '1' : month_param
  end

  def partial_date_day(year_param, month_param, day_param)
    (year_param != '' && (month_param == '' || day_param == '')) ? '1' : day_param
  end

  def partial_date_mask(year_param, month_param, day_param)
    return 0 if year_param == ''  # nothing
    return 4 if month_param == '' # 100
    return 6 if day_param == ''   # 110

    return 7                      # 111, full date
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def production_params
    params.require(:production).permit(:name, :description, :company_id,
                                       # director_invitations_attributes: [:id, :first_name, :last_name, :email, :to_id, :to_type, :type, :by],
                                       # artist_invitations_attributes: [:id, :first_name, :last_name, :email, :to_id, :to_type, :type, :by],
                                       shows_attributes: [:id, :production_id, :venue_id, :date, :opening_date_mask, :_destroy]
                                       )
  end

  # def send_director_invitation(production)
  #   inv = production.director_invitations.last
  #   if production.director_invitations.where(email: inv.email, by: inv.by).count > 1
  #     puts "Duplicate director invitation - INGORING"
  #     puts production.director_invitations.where(email: inv.email, by: inv.by).to_json
  #   else
  #     puts "Sending director invitation"
  #     AmMailer.invite_director(inv, production, 'An Artist Magnet user').deliver
  #   end
  # end
end
