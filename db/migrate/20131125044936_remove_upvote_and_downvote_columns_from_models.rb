class RemoveUpvoteAndDownvoteColumnsFromModels < ActiveRecord::Migration
  def up
    # Amendment
    remove_column :amendments, :upvotes
    remove_column :amendments, :downvotes

    # Comment
    remove_column :comments, :upvotes
    remove_column :comments, :downvotes
   
    # Discussion Topic
    remove_column :discussion_topics, :upvotes
    remove_column :discussion_topics, :downvotes
    
    # Proposal
    remove_column :proposals, :upvotes
    remove_column :proposals, :downvotes
  end

  def down
    # Amendment
    add_column :amendments, :upvotes, :integer
    add_column :amendments, :downvotes, :integer

    # Comment
    add_column :comments, :upvotes, :integer
    add_column :comments, :downvotes, :integer
   
    # Discussion Topic
    add_column :discussion_topics, :upvotes, :integer
    add_column :discussion_topics, :downvotes, :integer
    
    # Proposal
    add_column :proposals, :upvotes, :integer
    add_column :proposals, :downvotes, :integer
  end
end
