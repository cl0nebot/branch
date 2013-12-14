module FeedItemsHelper
  def feed_item_verb(feed_item)
    case feed_item.feedable_type
    when "Proposal"
      "proposed&hellip;".html_safe
    when "Amendment"
      link = link_to(feed_item.feedable.proposal.subject, proposal_path(feed_item.feedable.proposal))
      "amended \"#{link}\"".html_safe
    when "Comment"
      link = link_to(feed_item.feedable.commentable.subject, polymorphic_path(feed_item.feedable.commentable))
      "commented on \"#{link}\"".html_safe
    end
  end
end
