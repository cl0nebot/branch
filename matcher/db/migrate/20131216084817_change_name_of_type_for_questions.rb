class ChangeNameOfTypeForQuestions < ActiveRecord::Migration
  def change
    rename_column :matcher_questions, :type, :axis
  end
end
