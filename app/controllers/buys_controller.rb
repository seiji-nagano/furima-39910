class BuysController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @buyform = BuyForm.new
  end

  def create
  end
  
end
