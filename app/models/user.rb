EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

class User < ActiveRecord::Base
  has_secure_password
  before_validation :downcase_email

  has_many :favorites
  has_many :properties

  # has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }
  # validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/


  validates :email, presence: true, uniqueness: true, format: { with: EMAIL_REGEX }

  with_options if: :is_agent_landlord? do |agent_landlord|

    agent_landlord.validates :first_name, :last_name, presence: true, length: { in: 1..20 }
    agent_landlord.validates :zipcode, :phone_number, presence: true

  end





  def downcase_email
    self.email.downcase!
  end

  def is_agent_landlord?
    self.agent || self.landlord ? true : false
  end
end
