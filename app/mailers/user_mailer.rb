class UserMailer < ApplicationMailer
  default from: 'azcrowdfunding@gmail.com'
#AZ123456!
  def funding_email
    @user = params[:user]
    mail(to: @user.email, subject: 'You have received a funding, please Accept to validate')
  end
end
