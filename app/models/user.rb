class User < ActiveRecord::Base
  has_secure_password
  before_validation :normalize_email, on: :create
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitiveness: false }, format: { with: EMAIL_REGEX } 
  validates :name, presence: true


  private
    def normalize_email
      self.email = email.downcase
    end

end
