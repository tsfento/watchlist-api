class DailyQuote < ApplicationRecord
  validates :date, presence: true
  validates :quote, presence: true

  belongs_to :watch_title
end
