# This migration comes from matcher (originally 20131115205146)
class CreateMatcherQuestions < ActiveRecord::Migration
  def change
    create_table :matcher_questions do |t|
      t.integer :type
      t.integer :parity
      t.string :prompt

      t.timestamps
    end
  end
end
