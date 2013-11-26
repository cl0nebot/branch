class DiscussionTopicsController < ApplicationController
  before_action :set_discussion_topic, only: [:show, :edit, :update, :destroy]

  # GET /discussion_topics
  # GET /discussion_topics.json
  def index
    @discussion_topics = DiscussionTopic.all
  end

  # GET /discussion_topics/1
  # GET /discussion_topics/1.json
  def show
  end

  # GET /discussion_topics/new
  def new
    @discussion_topic = DiscussionTopic.new
  end

  # POST /discussion_topics
  # POST /discussion_topics.json
  def create
    @discussion_topic = DiscussionTopic.new(discussion_topic_params)

    respond_to do |format|
      if @discussion_topic.save
        format.html { redirect_to @discussion_topic, notice: 'Discussion topic was successfully created.' }
        format.json { render action: 'show', status: :created, location: @discussion_topic }
      else
        format.html { render action: 'new' }
        format.json { render json: @discussion_topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discussion_topics/1
  # DELETE /discussion_topics/1.json
  def destroy
    @discussion_topic.destroy
    respond_to do |format|
      format.html { redirect_to discussion_topics_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discussion_topic
      @discussion_topic = DiscussionTopic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def discussion_topic_params
      params.require(:discussion_topic).permit(:subject, :text)
    end
end

