class Location < ActiveRecord::Base
	belongs_to :client, inverse_of: :locations
	has_many :positions, dependent: :destroy
	has_many :machines, through: :positions

	accepts_nested_attributes_for :positions, :allow_destroy => true

	def custom_title
		short_name.upcase
	end

  def to_s
    custom_title
  end
end
