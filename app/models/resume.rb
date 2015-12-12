class Resume < ActiveRecord::Base
  # after_save :remove_data
  # after_save :add_education_table
  # after_save :add_custom_table
  after_save :add_representation_table
  
  attr_accessor :columns, :positions, :custom_cols, :custom_pos, :repr_cols, :repr_pos

  scope :directors, -> {all.uniq}
  scope :artists,   -> {all}
  scope :performing_artist, -> { where resume_type: 'Performing Artist' }
  scope :production_member, -> { where resume_type: 'Production Member' }

  belongs_to :user
  has_many :roles, dependent: :destroy
  has_many :directed_roles, :class_name => "Role", :foreign_key => 'director_id'
  has_many :productions, :through => :roles
  has_many :directed_productions, :class_name => "Production", :foreign_key => 'director_id'
  has_many :section_slots, -> { order('position ASC') }, :dependent => :destroy
  # has_one  :education_table, :dependent => :destroy
  # has_one  :skill_list, :dependent => :destroy
  # has_many :rtables, :through => :section_slots, :dependent => :destroy
  has_many :rtables
  # has_many :custom_lists,  :dependent => :destroy
  has_one :resume_attribute,:class_name=>"Attribute", dependent: :destroy
  has_one :contact_info, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :theatres, dependent: :destroy
  has_many :educations, dependent: :destroy
  has_many :representations, dependent: :destroy
  has_many :skills, dependent: :destroy  
  has_many :others, dependent: :destroy
  has_many :customs, dependent: :destroy
  has_many :resume_sections, dependent: :destroy
  has_many :videos, dependent: :destroy
  accepts_nested_attributes_for :resume_attribute,:allow_destroy => true, reject_if: :all_blank
  accepts_nested_attributes_for :contact_info,:allow_destroy => true, reject_if: :all_blank
  accepts_nested_attributes_for :photos,:allow_destroy => true, reject_if: :all_blank
  accepts_nested_attributes_for :theatres,:allow_destroy => true, reject_if: :all_blank
  accepts_nested_attributes_for :educations,:allow_destroy => true, reject_if: :all_blank
  accepts_nested_attributes_for :representations,:allow_destroy => true, reject_if: :all_blank
  accepts_nested_attributes_for :skills,:allow_destroy => true, reject_if: :all_blank
  accepts_nested_attributes_for :others,:allow_destroy => true, reject_if: :all_blank
  accepts_nested_attributes_for :customs,:allow_destroy => true, reject_if: :all_blank
  accepts_nested_attributes_for :resume_sections,:allow_destroy => true, reject_if: :all_blank

  accepts_nested_attributes_for :rtables,:allow_destroy => true, reject_if: :all_blank

  accepts_nested_attributes_for :roles, allow_destroy: true, reject_if: :all_blank
  delegate :name, :to => :user, :prefix => true

  validates :user, :presence => true
  validate :validate_resumes
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }#, :default_url => "../assets/blankUser.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  def validate_resumes
    if roles.any? && !roles[0].valid?
      # errors.clear
      errors.add(:role_name, roles[0].errors[:name].first)
    end
  end

  def name
    user.full_name
  end

  def remove_data
    Rtable.where(resume_id: id).destroy_all
    resume=Resume.find(id).section_slots
    resume.destroy_all if !resume.blank?
  end
  def add_education_table
    table = Rtable.create(title: 'Education', columns: '{'+self.columns+'}', positions: '{'+self.positions+'}', resume_id: id)
    SectionSlot.create(section_id: table.id, section_type: 'Rtable', resume_id: id, position: 1)
  end

  def add_custom_table
    table = Rtable.create(title: 'Custom', columns: '{'+self.custom_cols+'}', positions: '{'+self.custom_pos+'}', resume_id: id)
    SectionSlot.create(section_id: table.id, section_type: 'Rtable', resume_id: id, position: 1)
  end

  def add_representation_table
    table = Rtable.create(title: 'Representation', columns: '{'+self.repr_cols+'}', positions: '{'+self.repr_pos+'}', resume_id: id)
    SectionSlot.create(section_id: table.id, section_type: 'Rtable', resume_id: id, position: 1)
  end

  def add_rtable
    table = Rtable.create(title: 'Other', columns: '{Column 1,Column 2,Column 3,Column 4,Column 5,Column 6}', positions: '{1,2,3,4,5,6}')
    max_pos = SectionSlot.where('resume_id = ?', id).maximum("position")
    SectionSlot.create(section_id: table.id, section_type: 'Rtable', resume_id: id, position: max_pos + 1)
  end

end
