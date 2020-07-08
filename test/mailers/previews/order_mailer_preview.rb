# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/order_mailer/confirmation
  def confirmation
  	@user = User.find_by_email("hombre@masculinida")
  	@order = Order.find(2)
    OrderMailer.confirmation(@user, @order)
  end

end
