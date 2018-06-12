class UserMailer < ApplicationMailer
  default from: 'azcrowdfunding@gmail.com'
#AZ123456!
  def funding_email(fund,user)
    @fund = fund
    @user = user
    mail(to: @user.email, subject: 'You have received a funding, please Accept to validate')
  end
end
