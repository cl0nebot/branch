class AnswersController < ApplicationController
  layout 'ftue'

  def new
    axis = (SecureRandom.random_number * 2).round
    @question = Question.where(axis: axis).order('random()').first
    @profile = current_user.profile

    horizontal_count = @profile.answers.where(axis: 0).count
    vertical_count = @profile.answers.where(axis: 1).count
    lateral_count = @profile.answers.where(axis: 2).count

    if (@question.is_horizontal? && horizontal_count >= 4) ||
      (@question.is_vertical? && vertical_count >= 4) ||
      (@question.is_lateral? && lateral_count >= 4)
      redirect_to new_answer_path and return
    end

    if current_user.profile.answers.where(question_id: @question.id).count > 0
      redirect_to new_answer_path and return
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
        if @profile.answers.count < 12
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
