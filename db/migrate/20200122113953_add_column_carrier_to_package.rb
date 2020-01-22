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

    drop_table(:real_measures, if_exists: true)

    create_table :real_measures do |t|
      t.references :package, null: false, foreign_key: true
      t.float :real_length, null: false, default: 0.0
      t.float :real_width, null: false, default: 0.0
      t.float :real_height, null: false, default: 0.0
      t.float :real_weight, null: false, default: 0.0
      t.float :real_total_weight, null: false, default: 0.0
      t.references :real_distance_unit, foreign_key: { to_table: 'distance_units'}
      t.references :real_mass_unit, null: false, foreign_key: { to_table: 'mass_units'}

      t.timestamps
    end
  end
end
