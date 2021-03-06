class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @genres = Genre.all
    @item = Item.new(item_params)
    if @item.save
     redirect_to admin_item_path(@item)
    else
     render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def update
    @item = Item.find(params[:id])  # 1.インスタンス変数にセット
    @item.update(item_params)
    redirect_to  admin_items_path
  end

  private
  def item_params
    params.require(:item).permit(:genre_id, :name, :image,:introduction, :price, :is_active)
  end
end
