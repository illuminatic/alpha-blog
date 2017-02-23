class User < ActiveRecord::Base
  has_many :articles, dependent: :destroy # dependent: :destroy meand that all articles will be deleted if the user is deleted
  before_save {self.email = email.downcase}
  validates :username, presence: true,
            uniqueness: { case_sensitive: false},
            length: {minimum: 3, maximum: 25}

  VALID_EMAIL_REGEX= /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :email, presence: true,
            uniqueness: { case_sensitive: false},
            length: {maximum: 105},
            format: { with: VALID_EMAIL_REGEX}

  has_secure_password

end