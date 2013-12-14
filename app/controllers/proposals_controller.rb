class ProposalsController < ApplicationController
  before_action :authenticate_user!

  # GET /proposals
  # GET /proposals.json
  def index
    @proposals = current_user.proposals
  end

  # GET /proposals/1
  # GET /proposals/1.json
  def show
    @proposal = Proposal.find(params[:id])
    @amendments = @proposal.amendments.order(confidence: :desc)
    @comments = @proposal.comments.order(confidence: :desc)
  end

  # GET /proposals/new
  def new
    @proposal = current_user.proposals.build
  end

  # GET /proposals/1/edit
  def edit
    @proposal = current_user.proposals.find(params[:id])
  end

  # POST /proposals
  # POST /proposals.json
  def create
    @proposal = current_user.proposals.build(proposal_params)

    respond_to do |format|
      if @proposal.save
        # publish to the feed
        current_user.feed_items.publish(@proposal)

        format.html { redirect_to @proposal, notice: 'Proposal was successfully created.' }
        format.json { render action: 'show', status: :created, location: @proposal }
      else
        format.html { render action: 'new' }
        format.json { render json: @proposal.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def proposal_params
      params.require(:proposal).permit(:subject, :body)
    end
end
