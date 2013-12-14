class PagesController < ApplicationController
  def index
    if current_user
      redirect_to controller: 'feed_items', action: 'index'
    end
  end

  def show
    render params[:page]
  end
end
