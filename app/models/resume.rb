class Resume < ActiveRecord::Base
  after_save :add_education_table

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
  has_many :rtables, :through => :section_slots, :dependent => :destroy
  # has_many :custom_lists,  :dependent => :destroy

  accepts_nested_attributes_for :roles, allow_destroy: true, reject_if: :all_blank
  delegate :name, :to => :user, :prefix => true

  validates :user, :presence => true
  validate :validate_resumes

  def validate_resumes
    if roles.any? && !roles[0].valid?
      # errors.clear
      errors.add(:role_name, roles[0].errors[:name].first)
    end
  end

  def name
    user.full_name
  end

  def add_education_table
    table = EducationTable.create(title: 'Education', columns: '{School,City,State,Country,Degree,Year}', positions: '{1,2,3,4,5,6}')
    SectionSlot.create(section_id: table.id, section_type: 'Rtable', resume_id: id, position: 1)
  end

  # def add_rtable
  #   table = rtable.create(title: 'Other', columns: '{Column 1,Column 2,Column 3,Column 4,Column 5,Column 6}', positions: '{1,2,3,4,5,6}')
  #   max_pos = SectionSlot.where('resume_id = ?', id).maximum("position")
  #   SectionSlot.create(section_id: table.id, section_type: 'Rtable', resume_id: id, position: max_pos + 1)
  # end

end
