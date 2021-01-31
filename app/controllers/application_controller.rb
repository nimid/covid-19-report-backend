class ApplicationController < ActionController::API
  def serialize(object)
    return '{}' if object.nil?

    serializer_class = "#{object.class.name}Serializer".constantize
    JSON.pretty_generate(serializer_class.new(object).serializable_hash)
  end
end
