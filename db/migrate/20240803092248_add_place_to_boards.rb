class AddPlaceToBoards < ActiveRecord::Migration[7.1]
  def change
    add_column :boards, :place, :string
    add_column :boards, :latitude, :float
    add_column :boards, :longitude, :float
  end
end
