class UserMailer < ApplicationMailer
  default from: "naikhpratik@gmail.com"

  def sample_email(user)
    @user = user
    mail(to: "naikhpratik@gmail.com", subject: 'Sample Email')
  end
end
