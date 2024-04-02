class CreateDailyQuotes < ActiveRecord::Migration[7.1]
  def change
    create_table :daily_quotes do |t|
      t.datetime :date, null: false, default: Date.today.strftime("%Y-%m-%d")
      t.string :quote, null: false
      t.references :watch_title, null: false, foreign_key: true

      t.timestamps
    end
  end
end
