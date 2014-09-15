class Resume < ActiveRecord::Base
  belongs_to :user
  has_many :roles
  has_many :productions, :through => :roles

  accepts_nested_attributes_for :roles, allow_destroy: true, reject_if: :all_blank
  delegate :name, :to => :user, :prefix => true

end
