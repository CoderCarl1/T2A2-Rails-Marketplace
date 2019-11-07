class OrdersController < ApplicationController
  def new
    @tattoo = Tattoo.find(params[:tattoo_id])
    
    Stripe.api_key = ''
  end
end
