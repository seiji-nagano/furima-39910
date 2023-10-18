class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update]

  def index
    @items = Item.all.order(created_at: :desc)
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

  def show
  end

  def edit
    if user_signed_in? && current_user.id == @item.user_id
      if @item.order.present?
        redirect_to root_path
      else
        render :edit
      end
    else
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    item = Item.find(params[:id])
    if user_signed_in? && current_user == item.user
      item.destroy
    end
    redirect_to root_path
  end

  def set_item
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:title, :image, :explanation, :category_id, :situation_id, :liability_id, :prefecture_id, :delivery_days_id, :price).merge(user_id: current_user.id)
  end

end
