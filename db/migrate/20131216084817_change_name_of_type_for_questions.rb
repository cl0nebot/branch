class ChangeNameOfTypeForQuestions < ActiveRecord::Migration
  def change
    rename_column :questions, :type, :axis
  end
end
