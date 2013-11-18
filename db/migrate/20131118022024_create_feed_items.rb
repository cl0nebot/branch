class CreateFeedItems < ActiveRecord::Migration
  def change
    create_table :feed_items do |t|
      t.integer :user_id
      t.string :feedable_type
      t.integer :feedable_id

      t.timestamps
    end
  end
end
