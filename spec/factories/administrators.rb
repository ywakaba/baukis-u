FactoryBot.define do
  factory :administrator do
    sequence(:email) { |n| "administrator#{n}@example.com" }
    password { 'password' }
    suspended { false }
  end
end
