class Public::ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  # 確認画面を作成する場合はこのような記述になるかと思います。
  # newアクションから入力内容を受け取り、
  # 送信ボタンを押されたらcreateアクションを実行します。
  def confirm
    @contact = Contact.new(contact_params)
    if @contact.invalid?
      render :new
    end
  end

  # セキュリティーのためにも一定時間で入力内容の削除を行ってもいいかもしれません。
 def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.send_mail(@contact).deliver_now
      redirect_to root_path
    else
      render :new
    end
 end

   private

  def contact_params
    params.require(:contact).permit(:email,:name,:phone_number,:subject,:message)
  end
end
