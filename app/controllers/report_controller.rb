class ReportController  < ApplicationController
  def index
    #TODO: Add pagination and remove N+1
    packages = Package.all.includes(:real_measure, :label_distance_unit, :label_mass_unit, :carrier)

    @packages = Array.new

    packages.each do | package |
      tmp_package = Hash.new
      tmp_package[:tracking_number] =  package.tracking_number
      tmp_package[:platform_total_weight] = package.label_total_weight
      tmp_package[:label_total_weight] = package.label_total_weight.ceil
      tmp_package[:real_weight] = package.real_measure.real_weight
      tmp_package[:real_overweight] = tmp_package[:label_total_weight] - tmp_package[:real_weight]
      tmp_package[:label_overweight] = (tmp_package[:real_overweight]) < 0.0 ? 0 : (tmp_package[:real_overweight]).ceil
      tmp_package[:no_overweight] = tmp_package[:label_overweight] <= 0 ? true : false

      @packages.push(tmp_package)
    end
  end
end