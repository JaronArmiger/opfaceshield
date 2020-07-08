class OrderMailer < ApplicationMailer
  def confirmation(user, order)
  	@account = user.account
  	@order = order
    mail to: user.email, subject: "PPE Order for #{@account.institution_name}"
  end
end
