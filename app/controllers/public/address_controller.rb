class Public::AddressController < ApplicationController
  def index
    @addresses = current_customer
    @address = Address.new
  end

  def edit
  end

  def create
  end

  def update
  end


  def destory
  end

end
