class Package < ApplicationRecord
  belongs_to :carrier
  belongs_to :label_distance_unit, class_name: 'DistanceUnit'
  belongs_to :label_mass_unit, class_name: 'MassUnit'
  has_one :real_measure
end