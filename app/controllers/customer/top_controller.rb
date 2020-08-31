class Customer::TopController < ApplicationController
  def index
    raise ActiveRecord::RecordNotFound
#    raise Forbidden
	  render action: 'index'
  end
end
