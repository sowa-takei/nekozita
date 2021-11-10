class Public::HomesController < Public::ApplicationController
  #before_action :authenticate_customer!, except: [:top]

  def top
    @items = Item.all
  end

  def men
  end

  def women
  end
end
