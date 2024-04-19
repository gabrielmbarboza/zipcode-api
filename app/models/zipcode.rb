class Zipcode < ApplicationRecord
  belongs_to :user

  def full_address
    [address, neighborhood, city, uf, code].compact.join(", ")
  end
end
