class ProjectDatum < ApplicationRecord
  belongs_to :project
  validates :title, presence: true
  validates :description, precence: true
  validates :goal, precence: true
  validates :duration, presence: true
  validates :goal, numericality: { greater_than: 0 }
  after_create :init

  def init
    self.last_mod ||= DateTime.now
  end
end
