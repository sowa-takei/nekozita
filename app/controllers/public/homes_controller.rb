class Public::HomesController < ApplicationController
 
  def top
    @items = Item.all
  end

  def men
  end

  def women
  end
end
