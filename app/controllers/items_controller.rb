class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy] # 未ログインユーザーはログインページにリダイレクト
  before_action :set_item, only: [:edit, :update, :show]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def show
  end
 
  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :exp, :category_id, :situation_id, :freight_id, :dep_place_id_id, :schedule_date_id, :price,
                                 :image).merge(user_id: current_user.id)
  end

  def move_to_index
    # ログイン済みでも出品者でない場合はトップページにリダイレクト
      if current_user == @item.user || @item.order.present?
      redirect_to root_path 
  end
end
end
