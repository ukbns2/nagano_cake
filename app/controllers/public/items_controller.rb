class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @items = Item.page(params[:page]).per(8)
    @items_all = Item.all
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
  end
end
