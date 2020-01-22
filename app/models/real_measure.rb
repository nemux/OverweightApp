class RealMeasure < ApplicationRecord
  belongs_to :package
  belongs_to :real_distance_unit, class_name: 'DistanceUnit'
  belongs_to :real_mass_unit, class_name: 'MassUnit'
end