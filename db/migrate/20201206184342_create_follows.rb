class CreateFollows < ActiveRecord::Migration[5.2]
  def change
    create_table :follows do |t|
      t.integer :follower_id #make these references 
      t.integer :followed_user_id #make these references

      t.timestamps
    end
  end
end
