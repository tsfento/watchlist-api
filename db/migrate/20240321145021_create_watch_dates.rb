class CreateWatchDates < ActiveRecord::Migration[7.1]
  def change
    create_table :watch_dates do |t|
      t.datetime :date

      t.timestamps
    end
  end
end
