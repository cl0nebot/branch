class VotesController < ApplicationController
  def create
    @record = get_record

    @vote = current_user.votes.build({
      voteable_type: @record.class.name,
      voteable_id: @record.id,
      value: vote_params[:value]
    })

    respond_to do |format|
      if @vote.save
        upvotes = @record.votes.up.count
        downvotes = @record.votes.down.count
        voter = Voter.new(upvotes, downvotes, @record.created_at)

        if @record.respond_to?(:heat)
          @record.heat = voter.calculate_heat
        end

        if @record.respond_to?(:confidence)
          @record.confidence = voter.calculate_confidence
        end

        @record.save

        format.html { redirect_to(:back) }
        format.json { render json: @vote }

      else
        format.html { redirect_to(:back) }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:value)
  end

  def get_record
    if !params[:amendment_id].nil?
      return Amendment.find(params[:amendment_id])
    elsif !params[:comment_id].nil?
      return Comment.find(params[:comment_id])
    elsif !params[:discussion_topic_id].nil?
      return DiscussionTopic.find(params[:discussion_topic_id])
    elsif !params[:proposal_id].nil?
      return Proposal.find(params[:proposal_id])
    else
      raise "Can't vote on this record"
    end
  end
end
