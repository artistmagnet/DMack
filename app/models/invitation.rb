class Invitation < ActiveRecord::Base
  # validates :first_name, :presence => true
  # validates :last_name, :presence => true
  # validates :email,:presence => true, :email => true
  # validates :text, :presence => true

  belongs_to :to, :polymorphic => true
  belongs_to :by, :class_name => "User"

  def full_name
    [first_name, last_name].join(' ')
  end

  def by_name
    by.nil? ? '' : by.name
  end

  def self.emails
    Invitation.all.select{|invitation| invitation.email}
  end

end
