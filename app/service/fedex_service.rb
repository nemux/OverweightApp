class FedexService < BaseService

  def initialize()
    @fedex = Fedex::Shipment.new(:key => ENV['FEDEX_KEY'],
                                 :password => ENV['FEDEX_PASSWORD'],
                                 :account_number => ENV['FEDEX_ACCOUNT_NUMBER'],
                                 :meter => ENV['FEDEX_METER'],
                                 :mode => ENV['FEDEX_MODE'])

  end

  # Public Interface
  def self.track(tracking_number)
    new().track!(tracking_number)
  end

  def track!(tracking_number)
    begin
      fedex_response = @fedex.track(:tracking_number => tracking_number.to_s)
      ok_message(200, 'Request successful!', fedex_response)
    rescue Fedex::RateError => e
      Rails.logger.error e.message
      error_message(200, 'An error ocurred calling FEDEX External Service', e.message)
    rescue StandardError => e
      Rails.logger.error e.message
      error_message(200, 'An error ocurred, contact customer service.', e.message)
    end
  end
end