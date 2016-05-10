class CreateBusPositions < ActiveRecord::Migration
  def change
    create_table :bus_positions do |t|
      t.integer :bus_id, index: true
      t.time :time
      t.float :latitude, index: true
      t.float :longitude, index: true
      t.float :speed

      t.timestamps null: false
    end
  end
end
