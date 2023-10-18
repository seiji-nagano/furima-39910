class OrdersController < ApplicationController
  before_action :check_item_availability, only: [:index]
  before_action :authenticate_user!, only: [:index]
  before_action :set_order, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      pay_item
      @order_form.save(params,current_user.id)
      redirect_to root_path 
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private
  def order_params
    params.require(:order_form).permit(:post_code, :prefecture_id, :municipalities, :street_address, :building_name, :telephone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    item = Item.find(params[:item_id])
    Payjp::Charge.create(
      amount: item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def check_item_availability
    @item = Item.find(params[:item_id])
    unless @item.available? && current_user != @item.user
      redirect_to root_path
    end
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

end
