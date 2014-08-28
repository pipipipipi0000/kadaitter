class CreateFollowings < ActiveRecord::Migration
  def change
    create_table :followings do |t|
      t.integer :to_id
      t.integer :from_id

      t.timestamps
    end

    add_index :followings, %i(from_id to_id), unique: true
  end
end
