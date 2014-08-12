class Category < ActiveRecord::Base
	has_many :machines, inverse_of: :category
end
