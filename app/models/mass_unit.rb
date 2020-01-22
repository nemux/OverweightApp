class MassUnit < ApplicationRecord
  has_one :package, foreign_key: :label_mass_unit_id
  has_one :real_measure, foreign_key: :real_mass_unit_id
end