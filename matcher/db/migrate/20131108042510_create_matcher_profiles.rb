class CreateMatcherProfiles < ActiveRecord::Migration
  def change
    create_table :matcher_profiles do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.string :middle_name
      t.text :summary
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
