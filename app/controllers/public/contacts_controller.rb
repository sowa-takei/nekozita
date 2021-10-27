class Public::ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  # セキュリティーのためにも一定時間で入力内容の削除を行ってもいいかもしれません。
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.send_mail(@contact).deliver_now
      redirect_to done_path
    else
      render :new
    end
  end

   private

  def contact_params
    params.require(:contact).permit(:email,:name,:phone_number,:subject,:message)
  end
end
