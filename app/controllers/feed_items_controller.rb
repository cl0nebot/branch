class FeedItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    limit = params[:limit] || 100
    @feed_items = current_user.friends_feed_items.limit(limit)
  end

end
