class Resume < ActiveRecord::Base
  scope :directors, -> {all.uniq}
  scope :artists,   -> {all}

  belongs_to :user
  has_many :roles, dependent: :destroy
  has_many :directed_roles, :class_name => "Role", :foreign_key => 'director_id'
  has_many :productions, :through => :roles
  has_many :directed_productions, :class_name => "Production", :foreign_key => 'director_id'
  has_many :section_slots, -> { order('position ASC') }, :dependent => :destroy
  # has_one  :education_table, :dependent => :destroy
  # has_one  :skill_list, :dependent => :destroy
  # has_many :custom_tables, :dependent => :destroy
  # has_many :custom_lists,  :dependent => :destroy

  accepts_nested_attributes_for :roles, allow_destroy: true, reject_if: :all_blank
  delegate :name, :to => :user, :prefix => true

  validate :validate_resumes


  def validate_resumes
    if roles.any? && !roles[0].valid?
      # errors.clear
      errors.add(:role_name, roles[0].errors[:name].first)
    end
  end

  def name
    puts "NAMED RESUME: #{self.to_json}"
    puts "USER: #{user.to_json}"
    puts "USER NAME: #{user.fullname}"
    user.full_name
  end

end
