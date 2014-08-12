class Position < ActiveRecord::Base
	belongs_to :location, inverse_of: :positions
	has_many :machines

	accepts_nested_attributes_for :machines
end
