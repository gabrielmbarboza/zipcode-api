class SessionsController < ApplicationController
  skip_before_action :authenticate

  def login
    token = ::AuthenticationService.new(email: params[:email], password: params[:password]).call

    if token.present?
      render json: { token: token }
    else
      render json: { message: "There's something wrong with your credentials" }
    end
  end

  def signup
    user = User.new(email: params[:email], password: params[:password])

    if user.save
      token = ::JsonWebToken.encode({ email: params[:email], password: params[:password] })

      render json: { token: token }
    else
      render json: { message: "We can't create your profile with your credentials" }
    end
  end
end
