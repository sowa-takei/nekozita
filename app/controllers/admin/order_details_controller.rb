class Admin::OrderDetailsController < ApplicationController
  def update
    #変更した商品
    @order_detail = OrderDetail.find(params[:id])
    #大元注文
    #order = @order_detail.order
    @order_detail.update(order_detail_params)
    if @order_detail.making_status == "製作中"
      @order_detail.order.update(status: 2)
    end
    if @order_detail.order.order_details.count == @order_detail.order.order_details.where(making_status: "制作完了").count
      @order_detail.order.update(status: 3)
    end
    redirect_to admin_order_path(@order_detail.order_id)
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

end
