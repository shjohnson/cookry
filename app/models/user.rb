class User < ActiveRecord::Base
  has_secure_password

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :first_name, :last_name, presence: true
  validates :username, presence: true, uniqueness: true, length: { in: 3..20 }
  validates :email, presence: true, uniqueness: true, format: EMAIL_REGEX
  validates :password, length: { in: 6..20 }
end
