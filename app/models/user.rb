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
    return false if last_donation_at.nil?
    last_donation_at + period.months <= Date.today
  end

  def days_since_last_donation
    ((Time.current - last_donation_at.to_time) / 1.day).to_i
  end

  def make_admin
    update_attribute(:admin, true)
  end

  private

    def downcase_email
      email.downcase!
    end
end
