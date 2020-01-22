class AddColumnCarrierToPackage < ActiveRecord::Migration[6.0]
  def change
    drop_table(:packages, if_exists: true)

    create_table :packages do |t|
      t.string :tracking_number
      t.float :label_length, null: false, default: 0.0
      t.float :label_width, null: false, default: 0.0
      t.float :label_height, null: false, default: 0.0
      t.float :label_weight, null: false, default: 0.0
      t.float :label_total_weight, null: false, default: 0.0
      t.references :carrier, null: false, foreign_key: true
      t.references :label_distance_unit, null: false, foreign_key: { to_table: 'distance_units'}
      t.references :label_mass_unit, null: false, foreign_key: { to_table: 'mass_units'}

      t.timestamps
    end
  end
end
