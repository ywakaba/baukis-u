require 'rails_helper'

describe String do
	describe '#<<' do
		example '文字の追加' do
			s = "ABC"
			s << "D"
			expect(s.size).to eq(4)
		end

		xexample 'nilは追加できない' do
#			pending('調査中')
			s = "ABC"
			s << "D"
##			expect{ s << nil }.to raise_error(TypeError)
			expect(s.size).to eq(4)
		end
	end
end
