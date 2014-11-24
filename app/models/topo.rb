class Topo

  def self.countries
    @@countries ||= []
    if @@countries.empty?
      TOPO['countries'].each do  |record, content|
        @@countries << content['name']
      end
    end
    @@countries
  end

  def self.country_options
    @@country_options ||= []
    if @@country_options.empty?
      countries.each do |country_name|
        @@country_options << [country_name, country_name]
      end
    end
    @@country_options
  end

  def self.us_states
    @@us_states ||=[]
    if @@us_states.empty?
      TOPO['us_states'].each do |record, content|
        @@us_states << content
      end
    end
    @@us_states
  end

  def self.us_state_options
    @@us_state_options ||= []
    if @@us_state_options.empty?
      us_states.each do |state_name|
        @@us_state_options << [state_name, state_name]
      end
    end
    @@us_state_options
  end
end