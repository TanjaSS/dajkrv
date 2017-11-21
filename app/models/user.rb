class User < ApplicationRecord
  has_secure_password

  before_save :downcase_email

  validates :email, presence: true
  validates :password, presence: true

  private

    def downcase_email
      self.email.downcase!
    end
end
