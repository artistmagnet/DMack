class RtableItemsController < ApplicationController
  before_action :set_rtable_item, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @rtable_items = RtableItem.all
    respond_with(@rtable_items)
  end

  def show
    respond_with(@rtable_item)
  end

  def new
    @rtable_item = RtableItem.new
    respond_with(@rtable_item)
  end

  def edit
  end

  def create
    @rtable_item = RtableItem.new(rtable_item_params)
    @rtable_item.save
    @rtable = @rtable_item.rtable
    respond_with(@rtable)
  end

  def update
    @rtable_item.update(rtable_item_params)
    respond_with(@rtable)
  end

  def destroy
    @rtable_item.destroy
    respond_with(@rtable_item)
  end

  private
    def set_rtable_item
      @rtable_item = RtableItem.find(params[:id])
    end

    def rtable_item_params
      params.require(:rtable_item).permit({values: []}, :position, :rtable, :rtable_id)
    end
end
