class Machine < ActiveRecord::Base
  include Rails.application.routes.url_helpers, ActionView::Helpers::TranslationHelper
	belongs_to :category, inverse_of: :machines
	belongs_to :position, inverse_of: :machines
  has_many :repairments

	has_paper_trail

  def admin_history_info version
    name = model
    prev = version.previous.reify unless version.nil? || version.previous.nil?
    current = version.item
    difs = []
    first = t('created')
    unless prev.nil?
      first = t('changes_in')
      name = prev.model
      difs << "[#{t('position')}]" if prev.position != current.position
      difs << "[#{t('model')}]" if prev.model != current.model
      difs << "[#{t('code')}]" if prev.code != current.code
      difs << "[#{t('active_since')}]" if prev.active_since != current.active_since
    end
    "#{first.capitalize} #{name.upcase}: #{difs.join " "}"
  end

  def custom_title
    "#{model} en #{position.location.short_name} > #{position.name}"
  end

  def to_s
    custom_title
  end
end
