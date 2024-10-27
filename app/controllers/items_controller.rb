class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update] # ログイン必須アクション
  before_action :move_to_index, only: [:update, :edit]

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
    @item = Item.find(params[:id])
  end

  def show
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item) # 商品詳細ページにリダイレクト
    else
      render :edit, status: :unprocessable_entity # 更新に失敗した場合は編集ページを再表示
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :exp, :category_id, :situation_id, :freight_id, :dep_place_id, :schedule_date_id, :price,
                                 :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless current_user == @item_user
    redirect_to action: :index
  end
end
  end
