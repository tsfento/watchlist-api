class WatchList < ApplicationRecord
  validates :private, inclusion: [true, false]
  validates :title, presence: true, uniqueness: { scope: :user_id }

  belongs_to :user
  has_many :watch_list_followers
  has_many :users, through: :watch_list_followers
  # FYI, below will not throw an error, it just does not create a new record
  has_and_belongs_to_many :watch_titles

  def watch_titles_count
    watch_titles.count
  end

  def poster_imgs
    title_posters = watch_titles.all.sample(15).map do |title|
      title.poster_path
    end
  end
end
