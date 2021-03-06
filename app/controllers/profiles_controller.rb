class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  # GET /profiles
  # GET /profiles.json
  def index
    @profile = current_user.profile
    friend_ids = current_user.friendships.pluck(:friend_id)
    xcoord = @profile.xcoord
    ycoord = @profile.ycoord
    zcoord = @profile.zcoord

    @matches = Matcher::Profile.in_cube_area(xcoord, ycoord, zcoord).
      where{
        (user_id << friend_ids) &
        (user_id != my{current_user.id})
      }.limit(25).to_a

    @matches.sort!{ |p1, p2| @profile.match_percentage(p2) <=> @profile.match_percentage(p1) }
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
  end

  # GET /profiles/new
  def new
    @profile = Matcher::Profile.new
    @profile.user_id = current_user.id
    render :layout => 'ftue'
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Matcher::Profile.new(profile_params)
    @profile.user_id = current_user.id

    respond_to do |format|
      if @profile.save
        format.html { redirect_to matcher.new_answer_path, notice: 'Profile was successfully created.' }
        format.json { render action: 'show', status: :created, location: @profile }
      else
        format.html { render action: 'new' }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Matcher::Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:user_id, :first_name, :last_name, :nickname, :middle_name, :summary, :city, :state, :avatar)
    end
end
