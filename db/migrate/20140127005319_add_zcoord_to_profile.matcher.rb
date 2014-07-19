# This migration comes from matcher (originally 20131123204902)
class AddZcoordToProfile < ActiveRecord::Migration
  def change
    add_column :matcher_profiles, :zcoord, :integer
    remove_index :matcher_profiles, name: "index_on_profile_coordinates" 
    add_index :matcher_profiles, [:xcoord, :ycoord, :zcoord], name: 'index_on_profile_coordinates'
  end
end
