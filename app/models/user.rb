class User < ActiveRecord::Base
  has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  has_many :ideas
  has_many :likes, dependent: :destroy
  validates :name, :alias, :presence => true
  validates :email, presence: true, length: { minimum: 8 }, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  has_many :ideas_liked, through: :likes, source: :idea
  
end
