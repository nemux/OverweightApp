class DistanceUnit < ApplicationRecord
  has_one :package, foreign_key: :label_distance_unit_id
  has_one :real_measure, foreign_key: :real_distance_unit_id
end