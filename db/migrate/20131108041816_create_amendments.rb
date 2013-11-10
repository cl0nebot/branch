class CreateAmendments < ActiveRecord::Migration
  def change
    create_table :amendments do |t|
      t.integer :user_id
      t.integer :proposal_id
      t.string :subject
      t.text :body
      t.integer :upvotes
      t.integer :downvotes
      t.float :confidence
      t.float :heat

      t.timestamps
    end
  end
end
