class Request < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true

  after_initialize :set_defaults

  def set_defaults
    self.done ||= 0
  end

  def self.search(search)
      where("name ILIKE ? OR email ILIKE ? OR message ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  end

  scope :prioritize, lambda { order("done ASC") }

end
