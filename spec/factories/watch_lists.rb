FactoryBot.define do
  factory :watch_list do
    user
    private { false }
    title { Faker::Lorem.word }
  end
end
