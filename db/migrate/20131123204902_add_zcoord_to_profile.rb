class AddZcoordToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :zcoord, :integer
    remove_index :profiles, name: "index_on_profile_coordinates" 
    add_index :profiles, [:xcoord, :ycoord, :zcoord], name: 'index_on_profile_coordinates'
  end
end
