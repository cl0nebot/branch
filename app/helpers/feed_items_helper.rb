module FeedItemsHelper
  def feed_item_verb(feed_item)
    case feed_item.feedable_type
    when "Proposal"
      "proposed&hellip;".html_safe
    when "Amendment"
      "amended "
    when "Comment"
      "commented on "
    end
  end
end
