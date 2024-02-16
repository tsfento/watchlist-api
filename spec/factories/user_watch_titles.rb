FactoryBot.define do
  factory :user_watch_title do
    user
    watch_title
    watched { false }
    review { 'Review' }
  end
end
