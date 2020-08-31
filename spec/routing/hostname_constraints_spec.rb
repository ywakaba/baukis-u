require 'rails_helper'

describe 'ルーティング' do
  example '職員トップページ' do
   expect(get: 'http://baukis-u.example.com').to route_to(
			host: 'baukis-u.example.com',
			controller: 'staff/top',
			action: 'index'
		)
	end

  example '管理者ログインフォーム' do
    expect(get: 'http://baukis-u.example.com/admin/login').to route_to(
      :host => 'baukis-u.example.com',
      :controller => 'admin/sessions',
      :action => 'new'
    )
  end
end
