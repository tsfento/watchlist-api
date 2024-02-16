class CreateWatchTitles < ActiveRecord::Migration[7.1]
  def change
    create_table :watch_titles do |t|
      t.integer :tmdb_id
      t.string :imdb_id
      t.string :poster_path
      t.string :title
      t.datetime :release_date
      t.text :overview
      t.integer :runtime

      t.timestamps
    end
  end
end
