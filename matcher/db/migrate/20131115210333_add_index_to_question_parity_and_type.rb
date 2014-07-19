class AddIndexToQuestionParityAndType < ActiveRecord::Migration
  def change
    add_index :matcher_questions, [:type, :parity], name: "index_on_question_type_and_parity"
  end
end
