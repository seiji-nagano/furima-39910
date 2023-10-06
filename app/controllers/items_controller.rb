class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    #@items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def item_params
    params.require(:item).permit(:title, :image, :explanation, :category_id, :situation_id, :liability_id, :prefecture_id, :delivery_days_id, :price).merge(user_id: current_user.id)
  end

end
