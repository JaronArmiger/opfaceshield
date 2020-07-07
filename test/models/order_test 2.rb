require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  def setup
  	@order = orders(:one)
  end

  test "should be valid" do
  	assert @order.valid?
  end

  test "num_shields should be present" do
  	@order.num_shields = nil
  	assert_not @order.valid?
  end

  test "num_shields <= 999" do
  	@order.num_shields = 1000
  	assert_not @order.valid?
  end

  test "num_adjusters should be present" do
  	@order.num_adjusters = nil
  	assert_not @order.valid?
  end

  test "num_adjusters <= 999" do
  	@order.num_adjusters = 1000
  	assert_not @order.valid?
  end
  
  test "message should be present" do
    @order.message = nil
    assert_not @order.valid?
  end

  test "message should be <= 140 char" do
    @order.message = "q" * 141
    assert_not @order.valid?
  end

end
