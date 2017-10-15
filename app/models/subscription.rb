# Poplin Inspector instances maintain subscriptions to messages queues
class Subscription
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated

  belongs_to :user

  scope :user, ->(user) { where user_id: user }

  field :exchange, type: String, default: ''
  field :queue,    type: String, default: ''
end
