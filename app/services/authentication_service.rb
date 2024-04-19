class AuthenticationService
  def initialize(email:, password:)
    @email = email
    @password = password
  end

  def call
    user = User.find_by(email: @email)

    return if user.blank? || user.password != @password

    ::JsonWebToken.encode({ email: user.email, password: user.password })
  end
end
