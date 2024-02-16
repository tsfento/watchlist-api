FactoryBot.define do
  factory :user do
    username { Faker::Internet.username(specifier: 5..15, separators: %w(_)) }
    email { Faker::Internet.email }
    password { 'passw0rd!' }
    password_confirmation { 'passw0rd!' }
  end
end
