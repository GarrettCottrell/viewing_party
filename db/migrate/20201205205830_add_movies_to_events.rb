class AddMoviesToEvents < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :movie, foreign_key: true
  end
end
