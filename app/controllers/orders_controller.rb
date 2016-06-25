class OrdersController < ApplicationController
  

def express
	price_in_cents= params[:price].to_i * 100
  # response = EXPRESS_GATEWAY.setup_purchase(price_in_cents,
  #   :ip                => request.remote_ip,
  #   :return_url        => new_order_url,
  #   :cancel_return_url => root_url
  # )

  redirect_to paypal_url(new_order_url)

  # redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
end

def new
  @order = Order.new(:express_token => params[:token])
end

def create
	@order = current_user.orders.new
	# :express_token=>params[:order][:express_token],:express_payer_id=>params[:payer_id])
	 @order.ip_address = request.remote_ip
	if @order.save
	    if @order.purchase(params[:order][:express_token],params[:payer_id])
	    	@order.express_token=params[:order][:express_token]
	    	@order.express_payer_id=params[:payer_id]	    	
	    	current_user.update(:role=>"premium")
				@order.save
	      render :action => "success"
	    else
	      render :action => "failure"
	    end
	  else
	    render :action => 'new'
	  end
end

private

def paypal_url(return_path)
    values = {
        business: "merchant@gotealeaf.com",
        upload: 1,
        no_shipping: 1,
        return: "#{Rails.application.secrets.app_host}#{return_path}",
        notify_url: "http://our_ngrok_url/hook",
        invoice: "id",
        # item_name: "Upgrade Your Account"
        item_name: "Become a PowerMagnet"
    }
    values =    values.merge(
                    cmd: "_xclick-subscriptions",
                    a3: params[:price],
                    p3: 1,
                    srt: 2,
                    t3: "M"
                )
              # else
              #   values.merge(
              #       cmd: "_xclick",
              #       amount: "course.price",
              #       item_number: "course.id",
              #       quantity: '1'
              #   )
              # end
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end
end
