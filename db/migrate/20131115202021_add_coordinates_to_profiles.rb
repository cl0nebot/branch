class AddCoordinatesToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :xcoord, :integer, default: 0, max: 100, min: -100, null: false
    add_column :profiles, :ycoord, :integer, default: 0, max: 100, min: -100, null: false

    add_index :profiles, [:xcoord, :ycoord], name: "index_on_profile_coordinates"
  end
end
