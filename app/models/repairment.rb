class Repairment < ActiveRecord::Base
	has_many :parts, inverse_of: :repairment
	has_and_belongs_to_many :technicians
  belongs_to :machine

  just_define_datetime_picker :started_at
  just_define_datetime_picker :finished_at

  validates :machine, presence: true

  accepts_nested_attributes_for :parts, :allow_destroy => true

  class << self
    def states
      ['EN PROCESO', 'ESPERANDO PARTES', 'ESPERANDO TECNICOS', 'FINALIZADO']
    end
  end

end
