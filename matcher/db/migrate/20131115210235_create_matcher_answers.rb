class CreateMatcherAnswers < ActiveRecord::Migration
  def change
    create_table :matcher_answers do |t|
      t.integer :matcher_profile_id
      t.integer :matcher_question_id
      t.integer :value

      t.timestamps
    end
  end
end
