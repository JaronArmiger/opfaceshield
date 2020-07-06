require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  def setup
  	@account = accounts(:one)
  end

  test "should be valid" do
  	assert @account.valid?
  end

  test "institution name must be present" do
    @account.institution_name = nil
    assert_not @account.valid?
  end

  test "institution type must be present" do
    @account.institution_type = nil
    assert_not @account.valid?
  end

  test "contact first name must be present" do
    @account.contact_first_name = nil
    assert_not @account.valid?
  end

  test "contact last name must be present" do
    @account.contact_last_name = nil
    assert_not @account.valid?
  end

  test "phone number must be present" do
    @account.phone_number = nil
    assert_not @account.valid?
  end

  test "phone number must be 10 digits" do
  	@account.phone_number = 123456789
  	assert_not @account.valid?
  end

  test "phone number should only contain numbers" do
  	@account.phone_number = "A" * 10
  	assert_not @account.valid?
  end

  test "phone number should convert string digits to integer" do
  	@account.phone_number = "1" * 10
  	assert @account.valid?
  end
end
