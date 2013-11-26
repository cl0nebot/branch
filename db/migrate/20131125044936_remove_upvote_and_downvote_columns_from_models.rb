class RemoveUpvoteAndDownvoteColumnsFromModels < ActiveRecord::Migration
  def up
    # Amendment
    remove_column :amendments, :upvote
    remove_column :amendments, :downvote

    # Comment
    remove_column :comments, :upvote
    remove_column :comments, :downvote
   
    # Discussion Topic
    remove_column :discussion_topics, :upvote
    remove_column :discussion_topics, :downvote
    
    # Proposal
    remove_column :proposals, :upvote
    remove_column :proposals, :downvote
  end

  def down
    # Amendment
    add_column :amendments, :upvote, :integer
    add_column :amendments, :downvote, :integer

    # Comment
    add_column :comments, :upvote, :integer
    add_column :comments, :downvote, :integer
   
    # Discussion Topic
    add_column :discussion_topics, :upvote, :integer
    add_column :discussion_topics, :downvote, :integer
    
    # Proposal
    add_column :proposals, :upvote, :integer
    add_column :proposals, :downvote, :integer
  end
end
