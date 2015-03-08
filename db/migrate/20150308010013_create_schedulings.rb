class CreateSchedulings < ActiveRecord::Migration
  def change
    create_table :schedulings do |t|
      t.integer :room_id
      t.integer :user_id
      t.timestamp :time

      t.timestamps
    end
  end
end
