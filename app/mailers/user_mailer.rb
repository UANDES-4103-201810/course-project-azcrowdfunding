class UserMailer < ApplicationMailer
  default from: 'azcrowdfunding@gmail.com'
#AZ123456!
  def contribution_email(fund,user)
    @contribution = fund
    @user = user
    mail(to: @user.email, subject: 'You have received a contribution, please Accept to validate')
  end
  def funding_email(fund,user)
    @finance = fund
    @user = user
    mail(to: @user.email, subject: 'You have received a funding through promise, please Accept to validate')
  end
end
