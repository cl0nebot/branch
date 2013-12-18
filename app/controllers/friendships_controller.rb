class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def index
    @friendships = current_user.friendships.confirmed.includes(:user)
    @requests = Friendship.where(friend_id: current_user.id).unconfirmed.includes(:user)
  end

  def create
    inverse = Friendship.where{(friend_id == my{current_user.id}) & (user_id == my{params[:friend_id]})}.first

    if inverse
      # Confirm a Friendship
      inverse.confirmed = true
      @friendship = current_user.friendships.build({
        friend_id: params[:friend_id],
        confirmed: true
      })

      Friendship.transaction do
        if @friendship.save! && inverse.save!
          flash[:success] = "Friendship Confirmed"
          respond_to do |format|
            format.html { redirect_to friendships_path }
            format.json { render json: @friendship }
          end
        else
          flash[:error] = "Error confirming friendship"
          respond_to do |format|
            format.html { redirect_to friendships_path }
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
      
      if @friendship.save
        flash[:success] = "Friendship Requested"
        respond_to do |format|
          format.html { redirect_to profiles_path }
          format.json { render json: @friendship }
        end
      else
        flash[:error] = "Error requesting friendship"
        respond_to do |format|
          format.html { redirect_to profiles_path }
          format.json { render json: { error: flash[:error] } }
        end
      end
    end
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @inverse = Friendship.where( user_id: @friendship.friend_id,
                                friend_id: current_user.id ).first

    @friendship.destroy
    @inverse.destroy

    redirect_to friendships_path
  end

  private

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id)
  end
end
