class Provider < ActiveRecord::Base
  has_many :parts, inverse_of: :provider
end
