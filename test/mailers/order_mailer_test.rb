require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  def setup
  	@user = users(:alfonso)
  	@account = @user.account
  	@order = @account.orders.first
  end

  test "confirmation" do
    mail = OrderMailer.confirmation(@user, @order)
    assert_equal "PPE Order for #{@account.institution_name}", mail.subject
    assert_equal [@user.email], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match @account.contact_first_name, mail.body.encoded
    assert_match @account.institution_name, mail.body.encoded
  end

end
