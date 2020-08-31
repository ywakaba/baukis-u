require 'rails_helper'

RSpec.describe Staff::Authenticator do
	describe '#authenticate' do
		example '正しいパスワードならtrueを返す' do
			m = build(:staff_member)
			expect(Staff::Authenticator.new(m).authenticate('password')).to be_truthy
		end

		example '誤ったパスワードならfalseを返す' do
			m = build(:staff_member)
			expect(Staff::Authenticator.new(m).authenticate('xy')).to be_falsey
		end

		example 'パスワードが未設定ならfalseを返す' do
			m = build(:staff_member, password: nil)
			expect(Staff::Authenticator.new(m).authenticate(nil)).to be_falsey
		end

		example '停止フラグが立っていればfalseを返す' do
			m = build(:staff_member, suspended: true)
			expect(Staff::Authenticator.new(m).authenticate('password')).to be_falsey
		end

		example '開始前ならfalseを返す' do
			m = build(:staff_member, start_date: Date.tomorrow)
			expect(Staff::Authenticator.new(m).authenticate('password')).to be_falsey
		end

		example '終了後ならfalseを返す' do
			m = build(:staff_member, end_date: Date.today)
			expect(Staff::Authenticator.new(m).authenticate('password')).to be_falsey
		end

    example 'suspendedフラグが立っているならfalseを返す' do
      m = build(:staff_member, suspended: true)
      expect(Staff::Authenticator.new(m).authenticate('password')).to be_falsey
    end
  end
end
