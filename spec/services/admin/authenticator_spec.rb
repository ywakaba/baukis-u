require 'rails_helper'

RSpec.describe Admin::Authenticator do
	describe '#authenticate' do
		example '正しいパスワードならtrueを返す' do
			m = build(:staff_member)
			expect(Admin::Authenticator.new(m).authenticate('password')).to be_truthy
		end

		example '誤ったパスワードならfalseを返す' do
			m = build(:staff_member)
			expect(Admin::Authenticator.new(m).authenticate('xy')).to be_falsey
		end

		example 'パスワードが未設定ならfalseを返す' do
			m = build(:staff_member, password: nil)
			expect(Admin::Authenticator.new(m).authenticate(nil)).to be_falsey
		end

		example '停止フラグが立っていればfalseを返す' do
			m = build(:staff_member, suspended: true)
			expect(Admin::Authenticator.new(m).authenticate('password')).to be_falsey
		end

	end
end
