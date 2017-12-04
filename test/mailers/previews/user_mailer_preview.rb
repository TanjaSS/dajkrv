# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def remind
    UserMailer.remind(User.find_by(email: "stricevictanja@gmail.com"))
  end
end
