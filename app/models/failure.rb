class Failure < ActiveRecord::Base
	belongs_to :client, inverse_of: :failures

  just_define_datetime_picker :since
end
