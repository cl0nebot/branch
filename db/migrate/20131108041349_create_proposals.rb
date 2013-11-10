class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.string :subject
      t.text :body
      t.integer :user_id
      t.integer :upvotes
      t.integer :downvotes
      t.float :confidence
      t.float :heat

      t.timestamps
    end
  end
end
