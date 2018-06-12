class Contribution < ApplicationRecord
  belongs_to :user
  belongs_to :project
  before_create :confirmation_token

  validates :amount, presence: true
  validates :amount, numericality: { greater_than: 0 }

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
