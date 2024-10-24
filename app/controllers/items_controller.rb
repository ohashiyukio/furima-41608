class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create,]

  def index
     #@items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: '商品を出品しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :exp, :category_id, :situation_id, :freight_id, :dep_place_id, :schedule_date_id, :price,
                                 :image).merge(user_id: current_user.id)
  end
end
