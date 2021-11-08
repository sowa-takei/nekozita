class ApplicationController < ActionController::Base
  #before_action :authenticate_custoomer!,only: [:top]
  #before_action :authenticate_admin!,only: [:search]
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def set_search
    @search = Item.ransack(params[:q])
    @search_items = @search.result
  end

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_items_path
    when Customer
      customers_path
    end
  end

  def after_sign_out_path_for(resource)
   root_path
  end

   protected

   def reject_customer
    @customer = Customer.find_by(email: params[:user][:email].downcase)
    if @customer
      if (@customer.valid_password?(params[:customer][:password]) && (@customer.active_for_authentication? == true))
        flash[:error] = "退会済みです。"
        redirect_to new_customer_session_path
      end
    else
      flash[:error] = "必須項目を入力してください。"
    end
   end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :postal_code, :address, :last_name_kana,  :first_name_kana, :telephone_number])
  end
end


