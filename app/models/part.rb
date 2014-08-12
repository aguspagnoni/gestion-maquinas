class Part < ActiveRecord::Base
	belongs_to :repairment, inverse_of: :parts

  scope :unused, where(repairment_id: nil)

end
