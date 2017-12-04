class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  has_secure_password

  before_save :downcase_email

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :period, presence: true

  def self.to_remind
    User.all.select(&:send_reminder?)
  end

  def send_reminder?
    last_donation_at + period.months <= Date.today
  end

  def days_since_last_donation
    ((Time.current - last_donation_at.to_time) / 1.day).to_i
  end

  private

    def downcase_email
      self.email.downcase!
    end
end
