class Part < ActiveRecord::Base
	belongs_to :repairment, inverse_of: :parts
  belongs_to :provider, inverse_of: :parts

  just_define_datetime_picker :purchased_at


  scope :unused, where(repairment_id: nil)

  def custom_title
    code
  end

  def to_s
    custom_title
  end

end
