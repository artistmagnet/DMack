class RtablesController < ApplicationController
  before_action :set_rtable, :only => [:new, :create]
  before_action :find_rtable, :only => [:show, :edit, :update]
  before_action :set_item, :only => [:edit, :new]

  def new
  end

  def index
    @rtables = Rtable.all
  end

  def show
  end

  def edit
  end

  def create
    respond_to do |format|
      if @rtable.save
        format.html { redirect_to @rtable, notice: 'Table created' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @rtable.update(rtable_params)
        format.html { redirect_to @rtable, notice: 'Table updated' }
      else
        format.html { render :edit }
      end
    end
  end

  def rtable_params
    params.require(:rtable).permit(:id, :columns, :positions, :title)
  end

  def set_rtable
    @rtable = rtable_params ? Rtable.new(rtable_params) : Rtable.new
  end

  def find_rtable
    @rtable = Rtable.find(params[:id])
  end

  def set_item
    @rtable_item = RtableItem.new(:rtable => @rtable)
  end
end
