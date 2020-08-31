class Staff::SessionsController < Staff::Base
  skip_before_action :authorize

  def new
    p '人でなし'
    if current_staff_member
      p '何しい'
      redirect_to :staff_root
    else
      p '邦夫'
      @form = Staff::LoginForm.new
      p @form.email
      render action:  'new'
    end
  end

	def create
    logger.debug("1")
#		@form = Staff::LoginForm.new(params[:staff_login_form])
    @form =
      Staff::LoginForm.new(params.require(:staff_login_form).permit(:email, :password))
    logger.debug("2")
		if @form.email.present?
    logger.debug("3")
			staff_member = StaffMember.find_by(email_for_index: @form.email.downcase)
    logger.debug("4")
		end
    if Staff::Authenticator.new(staff_member).authenticate(@form.password)
      session[:staff_member_id] = staff_member.id
      session[:last_access_time] = Time.current
      staff_member.events.create!(type: 'logged_in')
      flash.notice = 'ログインしました。'
      redirect_to :staff_root
    else
      if staff_member.suspended?
        logger.debug("6")
        staff_member.events.create!(type: 'rejected')
        flash.now.alert = 'アカウントが停止されています。'
        render action:  'new'
      else
        logger.debug("5")
        flash.now.alert = 'メールアドレスまたはパスワードが正しくありません。'
        render action:  'new'
		  end
    end
	end
	def destroy
      if current_staff_member
        current_staff_member.events.create!(type: 'logged_out')
      end
		session.delete(:staff_member_id)
		flash.notice = 'ログアウトしました。'
		redirect_to :staff_root
	end
end
