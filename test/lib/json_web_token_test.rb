require "test_helper"

class JsonWebTokenTest < ActiveSupport::TestCase
  test "should encode the data" do
    token = ::JsonWebToken.encode({ email: "test@example.com", password: "123" })

    refute_nil token
  end

  test "should not encode the data, payload is nil" do
    assert_raises(StandardError) { ::JsonWebToken.encode(nil) }
  end

  test "should decode the token" do
    token = ::JsonWebToken.encode({ email: "test@example.com", password: "123" })
    decode_data = ::JsonWebToken.decode(token)

    assert_equal decode_data[0]["email"], "test@example.com"
    assert_equal decode_data[0]["password"], "123"
    assert_equal decode_data[1]["typ"], "JWT"
    assert_equal decode_data[1]["alg"], "HS256"
  end

  test "should not decode the token, token is nil" do
    assert_raises(StandardError) { ::JsonWebToken.decode(nil) }
  end

  test "should not decode the token, token is invalid" do
    assert_raises(StandardError) { ::JsonWebToken.decode(1234) }
  end
end
