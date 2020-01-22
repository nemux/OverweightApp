class Package < ApplicationRecord
  belongs_to :carrier
  belongs_to :distance_unit
  belongs_to :mass_unit
  has_one :real_measure
end