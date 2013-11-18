class FeedItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @feed_items = current_user.friends_feed_items.limit(params[:limit])
  end

end
