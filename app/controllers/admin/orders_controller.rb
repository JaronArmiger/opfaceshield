module Admin
  class OrdersController < ApplicationController
  	def index
  	  @processed = Order.where("processed = true")
  	  @unprocessed = Order.where("processed = false")
  	  #@orders = Order.all
  	end
  end
end