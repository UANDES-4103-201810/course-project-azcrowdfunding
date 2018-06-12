class Finance < ApplicationRecord
  belongs_to :user
  belongs_to :promise
  before_create :confirmation_token


  def status_activate
    self.status = true
    self.confirm_token = nil
    save!(:validate => false)

  end
  private
  def confirmation_token
    if self.confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end
end
