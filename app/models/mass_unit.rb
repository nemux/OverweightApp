class MassUnit < ApplicationRecord
  has_one :package, foreign_key: :label_mass_unit_id
end