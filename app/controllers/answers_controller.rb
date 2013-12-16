class AnswersController < ApplicationController
  def new
    axis = (SecureRandom.random_number * 3).round
    @question = Question.where(axis: axis).order('random()').first
    @answer = @question.answers.build(profile_id: current_user.profile.id, axis: axis)
  end

  def create
    @profile = current_user.profile
    @answer = @profile.answers.build(params[:answer])

    respond_to do |format|
      if @answer.save
        if @profile.answers.count < 10
          format.html { redirect_to :edit }
          format.json { render json: [@answer, @profile] }
        else
          @profile.calculate_coords!
          format.html { redirect_to feed_items_path }
          format.json { render json: [@answer, @profile] }
        end

      else
        # TODO: Error handle here
        raise "Still need to handle errors here"
      end
    end
  end
end
