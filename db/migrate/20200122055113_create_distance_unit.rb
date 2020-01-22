class CreateDistanceUnit < ActiveRecord::Migration[6.0]
  def change
    create_table :distance_units do |t|
      t.string :key
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
