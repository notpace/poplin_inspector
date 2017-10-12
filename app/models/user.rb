# If multiple poplin_inspector instances are running, they need to be separated by user
class User
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated

  has_many :subscriptions, dependent: :destroy
  has_many :messages, dependent: :destroy

  field :user, type: String, default: ENV['POPLIN_INSPECTOR_NAME']
end
