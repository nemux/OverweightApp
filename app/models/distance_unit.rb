class DistanceUnit < ApplicationRecord
  has_one :package, foreign_key: :label_distance_unit_id
end