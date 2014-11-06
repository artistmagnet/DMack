require 'uri'

class UriValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    unless value.blank?
      begin
        uri = URI.parse(value)
        if !(uri.kind_of?(URI::HTTP) || uri.kind_of?(URI::HTTPS))
          throw Error.new('AM address error')
        end
      rescue
        object.errors[attribute] << (options[:messages] || "must begin with 'http://' or 'https://")
      end
    end
  end
end


