class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  attr_accessible :name, :admin, :password, :password_digest

  field :name
  field :admin, :type => Boolean
  field :password
  field :password_digest

  has_secure_password
  validates_presence_of :password, :on => :create

end
