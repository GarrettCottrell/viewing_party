class CreateEvent < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :date
      t.string :start_time
      t.integer :duration
    end
  end
end
