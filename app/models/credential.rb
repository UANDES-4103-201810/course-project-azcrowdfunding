class Credential < ApplicationRecord
  belongs_to :user
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :username, length: { minimum: 6 }
  validates :username, length: { maximum: 25 }
  validates :password, length: { minimum: 6 }
  validates :password, length: { maximum: 25 }
  validates :sec_q, presence: true
  validates :answer, presence: true
  after_create :init

  def init
    self.last_mod ||= DateTime.now
  end

end
