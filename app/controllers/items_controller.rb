class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end
  
  def new
    @item = Item.new
  end

  def create
    item = Item.create(item_params)
    if item.save
      redirect_to root_path
    else
      @item = item
      render :new, status: :unprocessable_entity
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :item_text, :category_id, :status_id, :responsibility_id, :prefecture_id, :schedule_delivery_id, :price).merge(user_id: current_user.id)
  end
end
