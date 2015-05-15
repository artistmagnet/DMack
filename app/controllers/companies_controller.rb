class CompaniesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all.order(:name)
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
  end

  # GET /companies/new
  def new
    @company = Company.new(:name=>params[:name])
    respond_to do |format|
      format.js
    end
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)
    respond_to do |format|
      if @company.save
        # flash[:notice] ='Company was successfully created.'
        # format.js
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render json: @company }
      else
        # format.js { render :new }
        format.html { render :new }
        format.json { render json: @company.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { render json: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :address1, :address2, :city, :zipcode, :state, :country, :primary_contact_name, :primary_contact_email, :primary_contact_phone, :year_founded, :description, :email, :addr_fb, :addr_tw, :website, :phone,:photo_attributes=>[:image])
    end
end
