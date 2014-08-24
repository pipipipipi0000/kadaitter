class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.references :user, index: true, null: false
      t.string :text, limit: 150, null: false

      t.timestamps
    end
  end
end
