require 'stripe'

class OrdersController < ApplicationController
  def new
    @tattoo = Tattoo.find(params[:tattoo_id])
    
    Stripe.api_key = Rails.application.credentials.dig(:stripe, :api_key)
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: @tattoo.title,
        description: @tattoo.description,
        images: [],
        amount: (@tattoo.price * 100).to_i,
        currency: 'aud',
        quantity: 1
      }],
      success_url: "#{root_url}/orders/complete",
      cancel_url: "#{root_url}/orders/complete",
    )
  end

  def complete
    flash[:alert] = 'Your order has been processed successfully.'
    redirect_to tattoos_path
    # render html: '<h2>Thanks for your order!</h2>'.html_safe
  end

  def cancel
    redirect_to tattoos_path, notice: 'Your order has been cancelled!'
    # render html: '<h2>Your order has been cancelled!</h2>'.html_safe
  end
end
