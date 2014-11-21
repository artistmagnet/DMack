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
end