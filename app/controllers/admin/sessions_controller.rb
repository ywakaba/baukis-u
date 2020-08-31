class Admin::SessionsController < Admin::Base
  skip_before_action :authorize
	def new
		if current_administrator
			redirect_to	:admin_root
		else
			@form = Admin::LoginForm.new
#     flash.now.alert = '邦男'
			render action:	'new'
		end
	end
	def create
	  p "create"
#		@form = Admin::LoginForm.new(params[:admin_login_form])
    @form = Admin::LoginForm.new(params.require(:admin_login_form).permit(:email, :password))
		if @form.email.present?
    p "1"
			admin = Administrator.find_by(email_for_index: @form.email.downcase)
		end
		if !admin
		then
    p "2"
			flash.now.alert = 'メールアドレスまたはパスワードが正しくありません。'
			render action:	'new'
		elsif admin.suspended
    p "3"
			flash.now.alert = 'アカウントが停止されています。'
			render action:	'new'
#		elsif Admin::Authenticator.new(admin).authenticate(@form.password)
    else
    p "4"
			session[:administrator_id] = admin.id
      session[:last_access_time] = Time.current
			flash.notice = 'ログインしました。'
#			flash.now.alert = '外道。'
			redirect_to	:admin_root
#		else
#			flash.now.alert = 'メールアドレスまたはパスワードが正しくありません。'
#			render action:	'new'
		end
	end
	def destroy
		session.delete(:administrator_id)
		flash.notice = 'ログアウトしました。'
		redirect_to :admin_root
	end
end
