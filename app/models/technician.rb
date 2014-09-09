class Technician < ActiveRecord::Base
	has_and_belongs_to_many :repairments

  def full_name
    "#{last_name}, #{first_name}"
  end

  def custom_title
    first_name
  end

  def to_s
    custom_title
  end
end
