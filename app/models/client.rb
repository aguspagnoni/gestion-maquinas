class Client < ActiveRecord::Base
	has_many :locations, inverse_of: :client, dependent: :destroy
	has_many :failures, inverse_of: :client, dependent: :destroy
	has_many :machines, through: :locations

	def custom_title
		company_name.upcase
	end

  def to_s
    custom_title
  end

	accepts_nested_attributes_for :locations, :allow_destroy => true
end
