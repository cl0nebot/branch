class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :type
      t.integer :parity
      t.string :prompt

      t.timestamps
    end
  end
end
