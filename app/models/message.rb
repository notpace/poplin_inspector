# Messages received by the Poplin Inspector
class Message
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated

  field :text, type: String, default: ''
  field :exchange, type: String, default: ''
  field :queue, type: String, default: ''
end
