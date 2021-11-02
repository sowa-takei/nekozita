class Public::AddressController < ApplicationController
  def index
    @addresses = current_customer.addresses
    @address = Address.new
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    if @address = Address.new(address_params)
       @address.customer_id = current_customer.id
       @address.save
       redirect_to address_index_path(@address)
     else
       render :index
     end
  end

  def update
    @address = Address.find(params[:id])
    @address.save
    redirect_to address_index_path
  end


  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to address_index_path
  end

  private
   def address_params
     params.require(:address).permit(:customer_id, :name, :postal_code, :address)
   end

end
