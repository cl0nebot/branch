class AddAxisToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :axis, :integer

    add_index :answers, [:axis], name: "index_on_answer_axis"
  end
end
