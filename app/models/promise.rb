class Promise < ApplicationRecord
  belongs_to :project
  has_many :finances, :dependent => :destroy
  has_many :users, through: :finance
  validates :amount, presence: true
  validates :description, presence: true
end
