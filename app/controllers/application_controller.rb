class ApplicationController < ActionController::API
  before_action :authenticate

  private

  def authenticate
    header = request.headers['Authorization']
    token = header.split(' ').last if header.present?

    begin
      decode_data = ::JsonWebToken.decode(token)
      user_email = decode_data[0]["email"]
      user_password = decode_data[0]["password"]

      @current_user = User.find_by(email: user_email, password: user_password)
    rescue ActiveRecord::RecordNotFound => e
      render json: { message: e.message, status: :unauthorized }
    rescue StandardError => e
      render json: { message: e.message, status: :unauthorized }
    end
  end
end
