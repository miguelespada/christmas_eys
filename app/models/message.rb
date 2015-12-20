class Message
  include Mongoid::Document
  include Mongoid::Timestamps
  include CloudinaryHelper

  default_scope ->{ desc(:created_at) }

  field :name, type: String
  field :body, type: String
  field :url, type: String
  field :processed, type: Boolean, default: :false
  has_attachment  :the_gif, accept: [:gif]

  validates :the_gif, presence: true
  validates :name, presence: true
  validates :body, presence: true

  def cloudinay_img
    cl_image_tag( the_gif.path, :width => 1024, :height => 768, crop: :fill)
  end
end
