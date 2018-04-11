class Credential < ApplicationRecord
  belongs_to :user
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :password, length: { maximum: 20 }
  validates :sec_q, presence: true
  validates :answer, presence: true
  after_initialize :init

  def init
    self.last_mod ||= Date.today
  end

end
