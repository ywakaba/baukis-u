class Admin::TopController < Admin::Base
#class Admin::TopController < ApplicationController
  skip_before_action :authorize

  def index
    logger.debug("enter Admin::TopController#index")
    if current_administrator
     render action: 'dashboard'
    else
#		raise IpAddressRejected
		  render action: 'index'
	  end
  end
end
