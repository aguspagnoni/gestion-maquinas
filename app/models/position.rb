class Position < ActiveRecord::Base
	belongs_to :location, inverse_of: :positions
	has_many :machines
  has_one :client, through: :location

	accepts_nested_attributes_for :machines

  def custom_title
    "#{client} > #{location} > #{name}"
  end

  def to_s
    custom_title
  end
end
