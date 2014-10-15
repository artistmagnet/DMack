class Invitation < ActiveRecord::Base
  # validates :first_name, :presence => true
  # validates :last_name, :presence => true
  # validates :email,:presence => true, :email => true
  # validates :text, :presence => true

  belongs_to :to, :polymorphic => true

end
