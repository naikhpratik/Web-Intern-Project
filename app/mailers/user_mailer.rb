class UserMailer < ApplicationMailer
  default from: "C3suitetest@gmail.com"

  def sample_email(user,flag,product)
    @product = product
    @flag = flag
    @user = user
    mail(to: @user.email, subject: 'Sample Email')
  end
end
