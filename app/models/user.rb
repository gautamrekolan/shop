class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  ROLES = ["Admin", "Shop Admin", "Customer"]
  attr_accessible :name, :role, :password, :password_digest

  field :name
  field :role
  field :password
  field :password_digest

  has_secure_password
  validates_presence_of :name, :password, :role, :on => :create
  
  validates :name, :length => { :within => 4..60 }
  validates :password, :length => { :within => 6..20 }

  validates :name, :uniqueness => true

  validates :role, :inclusion => ROLES

end
