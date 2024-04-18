require 'net/http'

class ViacepService
  def initialize(zipcode)
    @zipcode = zipcode
  end

  def call
    clean_zipcode = @zipcode&.gsub(/[^0-9]/, '')
    viacep_uri    = URI("https://viacep.com.br/ws/#{clean_zipcode}/json/")

    begin
      viacep_response = Net::HTTP.get_response(viacep_uri)

      unless viacep_response.is_a?(Net::HTTPSuccess)
        Rails.logger.error("Viacep returned an error:  #{viacep_response.message} [#{viacep_response.code}]")
        return
      end

      viacep_data = JSON.parse(viacep_response.body)

      return if viacep_data&.key?("erro") && viacep_data["erro"]

      viacep_data
    rescue StandardError => e
      Rails.logger.error(e.message)
      nil
    end
  end
end
