FactoryBot.define do
  factory :user_watch_title do
    user { nil }
    watch_title { nil }
    watched { false }
    review { 'Review' }
  end
end
