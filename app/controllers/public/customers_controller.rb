class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to  customers_path
  end

  def withdrawal
    @customer = current_customer
  end

  def proces
    @customer = current_customer
    #is_deletedカラムにフラグを立てる(defaultはtrue)
    @customer.update(is_active: false)
    #ログアウトさせる
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  private
   def customer_params
      params.require(:customer).permit(:last_name,:last_name_kana,:first_name,:first_name_kana,:postal_code,:address,:telephone_number,:is_active,:gender,:email)
   end
end
