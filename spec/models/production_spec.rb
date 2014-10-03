require 'rails_helper'

RSpec.describe Production, :type => :model do
  context 'With respect to a venue'
    it 'knows when it is not featured'
    it 'knows when it is featured once'
    it 'knows when it is featured multiple times'
end
