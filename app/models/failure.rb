class Failure < ActiveRecord::Base
	belongs_to :client, inverse_of: :failures
end