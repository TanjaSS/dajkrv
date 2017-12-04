class UserMailer < ApplicationMailer
  def remind(user)
    @user = user
    mail(to: user.email, subject: 'Vreme je da date krv')
  end
end
