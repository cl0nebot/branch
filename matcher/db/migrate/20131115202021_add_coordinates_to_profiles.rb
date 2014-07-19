class AddCoordinatesToProfiles < ActiveRecord::Migration
  def change
    add_column :matcher_profiles, :xcoord, :integer, default: 0, max: 100, min: -100, null: false
    add_column :matcher_profiles, :ycoord, :integer, default: 0, max: 100, min: -100, null: false

    add_index :matcher_profiles, [:xcoord, :ycoord], name: "index_on_profile_coordinates"
  end
end
