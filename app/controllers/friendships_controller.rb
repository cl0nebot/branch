class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def index
    @friends = current_user.confirmed_friendships
    @pending = current_user.unconfirmed_friendships
  end

  def create
    inverse = Friendships.where{(friend_id == current_user.id) & (user_id == params[:friend_id])}.first

    if inverse
      # Confirm a Friendship
      inverse.confirmed == true
      @friendship = current_user.friendships.build({
        friend_id: params[:friend_id],
        confirmed: true
      })

      Frienship.transaction do
        if @friendship.save! && inverse.save!
          flash[:success] = "Friendship Confirmed"
          respond_to do |format|
            format.html { redirect_to friends_path }
            format.json { render json: @friendship }
          end
        else
          flash[:error] = "Error confirming friendship"
          respond_to do |format|
            format.html { redirect_to friends_path }
            format.json { render json: { error: flash[:error] } }
          end
        end
      end
    else
      # Request a friendship
      @friendship = current_user.friendships.build({
        friend_id: params[:friend_id],
        confirmed: false
      })

      if @friendship.save!
        flash[:success] = "Friendship Requested"
        respond_to do |format|
          format.html { redirect_to matches_path }
          format.json { render json: @friendship }
        end
      else
        flash[:error] = "Error requesting friendship"
        respond_to do |format|
          format.html { redirect_to matches_path }
          format.json { render json: { error: flash[:error] } }
        end
      end
    end
  end

  def destroy
  end

  private

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id)
  end
end
