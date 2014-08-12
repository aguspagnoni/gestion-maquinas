class Part < ActiveRecord::Base
	belongs_to :repairment, inverse_of: :parts

  scope :unused, where(repairment_id: nil)

  def custom_title
    code
  end

  def to_s
    custom_title
  end

end
