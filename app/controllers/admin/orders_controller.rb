module Admin
  class OrdersController < ApplicationController
  	def index
  	  @processed = Order.where("processed = true")
  	  @unprocessed = Order.where("processed = false")
  	  #@orders = Order.all
  	end

  	def show
  	 @order = Order.find(params[:id])
  	end

  	def processed
  	  @processed = Order.where("processed = true")		
  	end

  	def unprocessed
  	  @unprocessed = Order.where("processed = false")
  	end

    def update
      puts params[:process]
    end
  end
end