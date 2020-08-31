class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  layout :set_layout
  
  class Forbidden < ActionController::ActionControllerError
  end
  class IpAddressRejected < ActionController::ActionControllerError
  end

  rescue_from Exception, with: :rescue500
  rescue_from Forbidden, with: :rescue403
  rescue_from IpAddressRejected, with: :rescue403
  rescue_from ActionController::RoutingError, with: :rescue404
  rescue_from ActiveRecord::RecordNotFound, with: :rescue404

  include ErrorHandlers if Rails.env.production?

  private
  def set_layout
  	if params[:controller].match(%r{\A(staff|admin|customer)/})
  		Regexp.last_match[1]
  	else
  		'customer'
  	end
  end

  def rescue403(e)
   	#render :text => '何しぁE
  	p 'Nanishii!!'
   	p e
   	@exception = e
   	render 'errors/forbidden', status: 403
  end

   def rescue404(e)
   	 @exception = e
   	 render 'errors/not_found', status: 404
   end

  def rescue500(e)
  	#render :text => '外道'
  	p 'Gedou!!'
   	p e
    @exception = e
#	   	render template: 'errors/internal_server_error', status: 500, content_type: 'text/html'
    render template: 'errors/internal_server_error', status: 500
  end
end
