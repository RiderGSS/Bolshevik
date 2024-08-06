# frozen_string_literal: true

class UserMailer< ApplicationMailer
  default from: 'sergav1976@gmail.com'

  def welcome_email(name)
    @user = params[:user]
    @url  = 'https://bolshevik.onrender.com/users/sign_in'
    mail(to: @user.email,
         subject: t(:'email.welcome'),
         template_path: 'user_mailer',
         template_name: name)




  end




end
