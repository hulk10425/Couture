class SystemMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.system_mailer.send_invoice.subject
  #
  def send_mail(email,title,content)
    @title = title
    @content = content
    mail(:to =>email  ,:subject => title)
    WebLog.create(:title => title,:content =>'email:'+email+','+content,:sms_type => "email")
  end
  
  def send_mail_to_admin(title,content)
    @title = title
    @content = content
    mail(:to =>ENV["Service_email"],:subject => title)
    WebLog.create(:title => title,:content =>'email:'+ENV["Service_email"]+','+content,:sms_type => "email")
  end

  def send_invoice(order)
    @order = order
    @user = order.user
    @landload = User.find(order.target_user_id)
    title = "Petopia-完成繳費訂單明細-##{@order.order_number}-#{@landload.landload_name}"
    mail(:to =>@user.email  ,:subject => title) if @user.email.present?
    WebLog.create(:title => title,:content => "user_id:#{@order.user_id}",:sms_type => "email") if @user.email.present?
  end

  def send_book_info_to_landload(order)
    @order = order
    @user = order.user
    @landload = User.find(order.target_user_id)
    title = "Petopia提醒：有人向您預訂房間囉！-##{@order.order_number}-總金額#{@order.total_price}"
    mail(:to =>@landload.email  ,:subject => title) if @landload.email.present?
    WebLog.create(:title => title,:content => "landload_user.id:#{@landload.id}",:sms_type => "email") if @landload.email.present?
  end

  def send_book_info_to_admin(order)
    @order = order
    @user = order.user
    @landload = User.find(order.target_user_id)
    title = "有人完成訂單囉！-##{@order.order_number}-總金額#{@order.total_price}"
    mail(:to =>ENV["Service_email"]  ,:subject => title)
    WebLog.create(:title => title,:content => ENV["Service_mail"],:sms_type => "email")
  end

  def send_confirm_to_user(order)
    @order = order
    @user = order.user
    @landload = User.find(order.target_user_id)
    title = "#{@landload.landload_name}已經確認了您的訂單！-##{@order.order_number}"
    mail(:to =>ENV["Service_email"]  ,:subject => title)
    WebLog.create(:title => title,:content => ENV["Service_mail"],:sms_type => "email")
  end

  def send_confirm_to_admin(order)
    @order = order
    @user = order.user
    @landload = User.find(order.target_user_id)
    title = "有人完成訂單囉！-##{@order.order_number}-總金額#{@order.total_price}"
    mail(:to =>ENV["Service_email"]  ,:subject => title)
    WebLog.create(:title => title,:content => ENV["Service_mail"],:sms_type => "email")
  end

end
