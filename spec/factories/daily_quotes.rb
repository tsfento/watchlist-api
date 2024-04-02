FactoryBot.define do
  factory :daily_quote do
    date { "2024-04-02 11:22:08" }
    quote { "MyString" }
    watch_title { nil }
  end
end
