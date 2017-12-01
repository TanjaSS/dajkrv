class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  has_secure_password

  before_save :downcase_email

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :period, presence: true

  def send_reminder?
    last_donation_at + period.months <= Date.today
  end

  private

    def downcase_email
      self.email.downcase!
    end
end
