# This migration comes from matcher (originally 20131216084817)
class ChangeNameOfTypeForQuestions < ActiveRecord::Migration
  def change
    rename_column :matcher_questions, :type, :axis
  end
end
