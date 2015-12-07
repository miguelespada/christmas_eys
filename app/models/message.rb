class Message
  include Mongoid::Document
  include Mongoid::Timestamps

  default_scope ->{ desc(:created_at) }

  field :name, type: String, default: ""
  field :body, type: String, default: ""
  field :processed, type: Boolean, default: :false
end
