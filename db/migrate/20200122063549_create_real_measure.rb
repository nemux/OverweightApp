class CreateRealMeasure < ActiveRecord::Migration[6.0]
  def change
    create_table :real_measures do |t|
      t.references :package, null: false, foreign_key: true
      t.float :real_length, null: false, default: 0.0
      t.float :real_width, null: false, default: 0.0
      t.float :real_height, null: false, default: 0.0
      t.float :real_weight, null: false, default: 0.0
      t.float :real_total_weight, null: false, default: 0.0
      t.references :real_distance_unit, null: false, foreign_key: true
      t.references :real_mass_unit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
