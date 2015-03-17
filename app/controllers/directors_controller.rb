class DirectorsController < ApplicationController
  before_action :set_director, only: [:edit, :update, :destroy]
  respond_to :html,:js

  def index
    @directors = Director.all
    respond_with(@directors)
  end

  def show
    @director = Director.find_by_name(:name=>params[:id])
    respond_with(@director)
  end

  def new
    @director = Director.new(:name=>params[:name])
    #respond_with(@director)
    respond_to do |format|
      format.js
      format.html
    end
  end

  def edit
  end

  def create
    @director = Director.new(director_params)
    @director.save
    respond_with(@director)
  end

  def update
    @director.update(director_params)
    respond_with(@director)
  end

  def destroy
    @director.destroy
    respond_with(@director)
  end

  private
    def set_director
      @director = Director.find(params[:id])
    end

    def director_params
      params.require(:director).permit(:name,:first_name, :last_name, :email, :text)
    end
end
