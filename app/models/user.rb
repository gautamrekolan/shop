require 'securerandom'

class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i


  ROLES = ["Admin", "Shop Admin", "Customer"]
  attr_accessible :name, :role, :email, :password, :password_digest,:password_reset_sent_at

  field :name
  field :email
  field :role
  field :password
  field :password_digest
  field :password_reset_sent_at, :type => DateTime
  
  has_secure_password
  validates_presence_of :name, :email, :password, :role, :on => :create
  
  validates :name, :length => { :within => 4..60 }
  validates :password, :length => { :within => 6..20 }
  validates :email, :format=> { :with => email_regex }
  validates :name, :uniqueness => true

  validates :role, :inclusion => ROLES


  def generate_new_password
    new_password = SecureRandom.hex(8)
    self.password = new_password
  end

  def send_password_reset
    generate_new_password
    self.password_reset_sent_at = Time.zone.now
    self.save(:validate => false)
    UserMailer.password_reset(self).deliver
  end
  
end
