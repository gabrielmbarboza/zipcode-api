require "test_helper"

class ViacepServiceTest < ActiveSupport::TestCase
  test "should return a valid zip code data" do
    zipcode_info = {
      "cep"=>"29050-945",
      "logradouro"=>"Avenida Marechal Mascarenhas de Moraes",
      "complemento"=>"1927",
      "bairro"=>"Bento Ferreira",
      "localidade"=>"Vitória",
      "uf"=>"ES",
      "ibge"=>"3205309",
      "gia"=>"",
      "ddd"=>"27",
      "siafi"=>"5705"}

    VCR.use_cassette("zipcode_data") do
      zipcode      = "29050-945"
      zipcode_data = ::ViacepService.new(zipcode).call

      assert_equal zipcode_data, zipcode_info
    end
  end

  test "should return nil. The zip code is invalid" do
    VCR.use_cassette("zipcode_empty_data") do
      zipcode      = "99999-999"
      zipcode_data = ::ViacepService.new(zipcode).call

      assert_nil zipcode_data
    end
  end
end
