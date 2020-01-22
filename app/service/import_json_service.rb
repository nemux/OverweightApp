class ImportJsonService < BaseService
  def initialize(json)
    @json = json
  end

  # Public Interface
  def self.import(json)
    new(json).import!
  end

  def import!
    #TODO: Add validations for all the fields for every package information.
    if @json.is_a? Array
      @json.each do |package_info|
        Rails.logger.debug package_info
        package = Package.find_by(tracking_number: package_info["tracking_number"]) || Package.new
        package.tracking_number = package_info["tracking_number"]
        package.carrier = Carrier.find_by(name: package_info["carrier"])
        package.label_length = package_info["parcel"]["length"]
        package.label_width = package_info["parcel"]["width"]
        package.label_height = package_info["parcel"]["height"]
        package.label_weight = package_info["parcel"]["weight"]
        package.label_distance_unit = DistanceUnit.find_by(key: package_info["parcel"]["distance_unit"].to_s.upcase)
        package.label_mass_unit = MassUnit.find_by(key: package_info["parcel"]["mass_unit"].to_s.upcase)
        volumetric_weight = volumetric_weight(package.label_width, package.label_height, package.label_length, package.label_distance_unit.key)
        tmp_weight = weight(package.label_weight, package.label_mass_unit.key)
        package.label_total_weight = volumetric_weight > tmp_weight ?
                                         volumetric_weight :
                                         tmp_weight
        package.save
        service_response = FedexService.track(package_info["tracking_number"])

        if service_response[:success]
          real_measure = package.real_measure || RealMeasure.new
          real_measure.package = package
          real_measure.real_length = service_response[:data].first.details[:package_dimensions][:length]
          real_measure.real_width = service_response[:data].first.details[:package_dimensions][:width]
          real_measure.real_height = service_response[:data].first.details[:package_dimensions][:height]
          real_measure.real_weight = service_response[:data].first.details[:package_weight][:value]
          real_measure.real_distance_unit = DistanceUnit.find_by(key: service_response[:data].first.details[:package_dimensions][:units].to_s.upcase)
          real_measure.real_mass_unit = MassUnit.find_by(key: service_response[:data].first.details[:package_weight][:units].to_s.upcase)
          real_measure.save
        end
      end
    end
  end
end