FactoryBot.define do
  factory :user do
    username { Faker::Internet.username(specifier: 5..15, separators: %w(_)) }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 8, max_length: 50, mix_case: true, special_characters: true) }
    password_confirmation { password }
  end
end
