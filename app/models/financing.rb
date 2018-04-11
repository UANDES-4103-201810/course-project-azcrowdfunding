class Financing < ApplicationRecord
  belongs_to :user
  belongs_to :promise
  after_create :init

  def init
    self.date ||= DateTime.now
  end
end
