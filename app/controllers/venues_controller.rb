class VenuesController < ApplicationController
  layout :set_inner_layout
  before_action :set_venue, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  skip_before_filter :verify_authenticity_token

  # GET /venues
  # GET /venues.json
  def index
    @venues = Venue.all.order(:name)
  end

  # GET /venues/1
  # GET /venues/1.json
  def show
  end

  # GET /venues/new
  def new
    @venue = Venue.new(:name=> params[:name])
    respond_to do |format|
      format.js
    end
  end

  # GET /venues/1/edit
  def edit
  end

  # POST /venues
  # POST /venues.json
  def create    
    # venue,company,image=new_object params
    
    # params[:venue]=venue
    # params[:company]=company
    # params[:image]=image
      @venue = Venue.new(venue_params)
      # @company = Company.new(company_params)
      # @company.state=params[:venue][:state]
      # @company.country=params[:venue][:country]
      # @company.save
      # @company.photos.create(params.require(:image).permit!) if params[:image].present?
        respond_to do |format|
          
            if @venue.save
              # @venue.photos.create(params.require(:image).permit!) if params[:image].present?
              # flash[:notice] ="Venue was successfully created."
              # format.js
              format.html { redirect_to @venue, notice: 'Venue was successfully created.' }
              format.js 
              # @venue = @venue.as_json(except: [:image_file_name,:image_content_type,:image_file_size,:image_updated_at])
              format.json { render json: @venue }
            else
              # format.js { render :new }
              format.html { render :new }
              format.json { render json: @venue.errors.full_messages, status: :unprocessable_entity }
            end
        end  
  end

  # PATCH/PUT /venues/1
  # PATCH/PUT /venues/1.json
  def update
    respond_to do |format|
      if @venue.update(venue_params)
        format.html { redirect_to @venue, notice: 'Venue was successfully updated.' }
        format.json { render json: @venue }
      else
        format.html { render :edit }
        format.json { render json: @venue.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /venues/1
  # DELETE /venues/1.json
  def destroy
    @venue.destroy
    respond_to do |format|
      format.html { redirect_to venues_url, notice: 'Venue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_venue
      @venue = Venue.find(params[:id])
    end

    def new_object params
      venue=Hash[params[:venue].map{|u,v| [u, v.split('-')[0]] if u!="image"}]
      company=Hash[params[:venue].map{|u,v| [u, v.split('-')[1]] if u!="image"}]
      image=Hash[params[:venue].map{|u,v| [u,v] if u=="image"}]
      return venue,company,image
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def venue_params
      params.require(:venue).permit(:name,:address1, :address2, :city, :zipcode, :state, :country, :description, :email, :addr_fb, :addr_tw, :addr_ins, :addr_lin, :website, :primary_contact_name, :primary_contact_email, :primary_contact_phone, :phone, :year_founded,:photo_attributes=>[:image])
    end

    def company_params
      params.require(:company).permit(:name, :address1, :address2, :city, :zipcode, :state, :country, :description, :email, :addr_fb, :addr_tw, :addr_ins, :addr_lin, :website, :primary_contact_name, :primary_contact_email, :primary_contact_phone, :phone, :year_founded)
    end
    
    def set_inner_layout
      "inner" if current_user
    end
end
