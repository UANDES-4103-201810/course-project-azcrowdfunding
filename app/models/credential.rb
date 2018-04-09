class Credential < ApplicationRecord
  belongs_to :user
  validates :username, presence: true
  validates :password, length: { maximum: 20 }
  validates :sec_q, presence: true
  validates :answer, presence: true

end
