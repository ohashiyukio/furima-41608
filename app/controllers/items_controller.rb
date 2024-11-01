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

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: '商品を出品しました'
    else
      render :new, status: :unprocessable_entity
    end
  end


  def edit
  end

  def show
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item), notice: '商品情報を更新しました' # 商品詳細ページにリダイレクト
    else
      render :edit, status: :unprocessable_entity # 更新に失敗した場合は編集ページを再表示
    end
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
    params.require(:item).permit(:name, :exp, :category_id, :situation_id, :freight_id, :dep_place_id, :schedule_date_id, :price,
                                 :image).merge(user_id: current_user.id)
  end

  def move_to_index
    # ログイン済みでも出品者でない場合はトップページにリダイレクト
    return unless current_user != @item.user && @item.order.present?
    redirect_to root_path
  end
end
