class Show < ActiveRecord::Base
  belongs_to :venue
  belongs_to :production

  delegate :name, :to => :production, :prefix => true
  # delegate :staging_period_at, :to => :production, :prefix => true

  PartialDate = Struct.new(:year, :month, :day)

  def opening_date_display
    if self.opening_date_mask == 0 || self.date == nil
      return 'No date is given.'
    elsif self.opening_date_mask == 6
      return self.date.strftime('%b %Y')
    elsif self.opening_date_mask == 4
      return self.date.strftime('%Y')
    else
      return self.date.strftime('%F')
    end
  end

  def get_date_select_opt
    opt = {start_year: 1950, end_year: 2030, prompt: { day: '--', month: '--', year: '--' }}
    if self.opening_date_mask == 0 || self.date == nil
      return opt.merge( selected: nil )
    elsif self.opening_date_mask == 6
      date = PartialDate.new(self.date.year, self.date.month, nil)
      return opt.merge( selected: date)
    elsif self.opening_date_mask == 4
      date = PartialDate.new(self.date.year, nil, nil)
      return opt.merge( selected: date)
    else
      return opt
    end
  end


  def venue_name
    venue.nil? ? "Unknown" : venue.name
  end

  #validate :validate_properties

  def validate_properties
    if venue_name.blank?
      errors.add :venue_name, "is invalid"
    end
    puts "date: #{date}"

    if date.nil?
      errors.add :operning_date, "is invalid. Please enter at least the year"
    end
  end
end
