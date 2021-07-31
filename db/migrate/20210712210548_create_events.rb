class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.text :description
      t.string :location, null: false
      t.datetime :starttime, null: false
      t.datetime :endtime
      t.string :organizeremail, null: false
      t.string :organizertelegram, null: false
      t.string :link

      t.timestamps
    end
  end
end
