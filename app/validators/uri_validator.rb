require 'uri'

class UriValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    uri = URI.parse(value)
    unless value.blank? || uri.kind_of?(URI::HTTP) || uri.kind_of?(URI::HTTPS)
      object.errors[attribute] << (options[:messages] || "must begin with 'http://' or 'https://")
    end
  end
end


