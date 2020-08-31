class Admin::Authenticator
	def initialize(admin_member)
		@admin_member = admin_member
	end
	
	def authenticate(row_password)
		@admin_member &&
			!@admin_member.suspended? &&
			 @admin_member.hashed_password &&
			 BCrypt::Password.new(@admin_member.hashed_password) == row_password
	end
end
