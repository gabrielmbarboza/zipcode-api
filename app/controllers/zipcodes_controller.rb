class ZipcodesController < ApplicationController

  # GET /zipcodes/11111-111
  def search
    zipcode = Zipcode.where(code: params[:zipcode], user_id: @current_user.id).first

    unless zipcode.present?
      zipcode_data = ::ViacepService.new(params[:zipcode]).call

      zipcode = Zipcode.create!(code: zipcode_data['cep'],
                                address: zipcode_data['logradouro'],
                                neighborhood: zipcode_data['bairro'],
                                city: zipcode_data['localidade'],
                                uf: zipcode_data['uf'],
                                user: @current_user)
    end

    render json: zipcode.as_json({ methods: %w[full_address] })
  rescue StandardError => e
    render json: { error: true, message: e.message }, status: :unprocessable_entity
  end
end
