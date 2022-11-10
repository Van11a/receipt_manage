class ReceiptsController < ApplicationController
  before_action :logged_in_user

  def index
    @receipts = current_user.receipts.all.order(usage_date: "DESC") 
    @user = current_user
    @receipt_total = Receipt.all.sum(:price)
  end

  def show
    @receipt = current_user.receipts.find(params[:id])
  end

  def new
    @receipt = current_user.receipts.build
    @user = current_user
  end

  def create
    @receipt = Receipt.new(receipt_params)
    if @receipt.save!
      flash[:danger] = "セーブに成功しました"
      redirect_to user_receipts_path(current_user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @receipt = current_user.receipts.find(params[:id])
  end

  def update
    begin
      @receipt = current_user.receipts.find(params[:id])
      @receipt.update(receipt_params)
      redirect_to user_receipts_path(current_user)
    rescue ActiveRecord::RecordNotFound => e
      falsh[:danger] = "指定したIDのレシートが見つかりませんでした"
    rescue 
      render :edit
    end
  end

  def update
    begin
      @receipt = current_user.receipts.find(params[:id])
      @receipt.update(receipt_params)
      redirect_to user_receipts_path(current_user)
    rescue ActiveRecord::RecordNotFound => e
      falsh[:danger] = "指定したIDのレシートが見つかりませんでした"
    rescue 
      render :edit
    end
  end

  private
    def receipt_params
      params.require(:receipt)
      .permit(:usage_date,:price,:usage,:publisher,:img).merge(user_id: params[:user_id])
    end
end
