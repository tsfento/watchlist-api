class AddContentTypeToWatchTitles < ActiveRecord::Migration[7.1]
  def change
    add_column :watch_titles, :content_type, :string, null: false, default: 'movie'
  end
end
