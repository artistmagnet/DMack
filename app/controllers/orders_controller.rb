class OrdersController < ApplicationController
  

def express
	price_in_cents= params[:price].to_i * 100
  response = EXPRESS_GATEWAY.setup_purchase(price_in_cents,
    :ip                => request.remote_ip,
    :return_url        => new_order_url,
    :cancel_return_url => root_url
  )
  redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
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


end
