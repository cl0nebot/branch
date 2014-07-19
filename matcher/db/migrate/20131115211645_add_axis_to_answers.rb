class AddAxisToAnswers < ActiveRecord::Migration
  def change
    add_column :matcher_answers, :axis, :integer

    add_index :matcher_answers, [:axis], name: "index_on_answer_axis"
  end
end
