class CreateDiscussionTopics < ActiveRecord::Migration
  def change
    create_table :discussion_topics do |t|
      t.integer :user_id
      t.string :subject
      t.text :text
      t.integer :upvotes
      t.integer :downvotes
      t.decimal :heat
      t.decimal :confidence

      t.timestamps
    end
  end
end
