class Custom < ActiveRecord::Base
	belongs_to :resume

  scope :header, -> { where(is_bold: true).first }
  scope :ordered, -> { order(is_bold: :desc).order(:position) }
end
