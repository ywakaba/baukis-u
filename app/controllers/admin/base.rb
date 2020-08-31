class Admin::Base < ApplicationController
  before_action :authorize
	private
	def current_administrator
    logger.debug("オエルモンカ!!")
		p :administrator_id
		p session[:administrator_id]
		if session[:administrator_id]
      logger.debug("デエダッケ!!")
      p @current_administrator
      p :administrator_id
      p session[:administrator_id]
			@current_administrator ||=
				Administrator.find_by(id: session[:administrator_id])
      logger.debug("チバケナ!!")
      p @current_administrator
		end
	end

  private
  def authorize
    logger.debug("enter Admin::Base#authorize")
    unless current_administrator
      flash.alert = '管理者としてログインしてください。'
      redirect_to :admin_login
    end
  end
  helper_method 	:current_administrator
end
