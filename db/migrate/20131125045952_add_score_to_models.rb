class AddScoreToModels < ActiveRecord::Migration
  def up
    add_column :amendments, :score, :integer
    add_column :comments, :score, :integer
    add_column :discussion_topics, :score, :integer
    add_column :proposals, :score, :integer
  end

  def down
    remove_column :amendments, :score
    remove_column :comments, :score
    remove_column :discussion_topics, :score
    remove_column :proposals, :score
  end
end
