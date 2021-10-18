class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = Customer.find(params[:id])  # 1.インスタンス変数にセット
    @customer.update(customer_params)
    redirect_to  orders_path
  end

  def withdrawal
  end

  def proces
  end

  private
   def customer_params
      params.require(:customer).permit(:last_name,:last_name_kana,:first_name,:first_name_kana,:postal_code,:address,:telephone_number,:is_active,:gender,:email)
   end
end
