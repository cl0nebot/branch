class AnswersController < ApplicationController
  layout 'ftue'

  def new
    axis = (SecureRandom.random_number * 3).round
    @question = Question.where(axis: axis).order('random()').first

    if @question.nil?
      redirect_to new_answer_path
    end

    @answer = @question.answers.build(profile_id: current_user.profile.id, axis: axis)
  end

  def create
    @profile = current_user.profile

    question_id = params[:answer][:question_id]
    axis = params[:answer][:axis]
    parity = params[:answer][:parity].to_i
    value = params[:answer][:value].to_i * parity
    
    @answer = @profile.answers.build({
      question_id: question_id,
      axis: axis,
      value: value
    })

    respond_to do |format|
      if @answer.save
        if @profile.answers.count < 10
          format.html { redirect_to new_answer_path }
          format.json { render json: [@answer, @profile] }
        else
          @profile.calculate_coords!
          format.html { redirect_to profiles_path }
          format.json { render json: [@answer, @profile] }
        end

      else
        # TODO: Error handle here
        raise "Still need to handle errors here"
      end
    end
  end
end
