class Project < ApplicationRecord
  has_attached_file :main_image, styles: { large: "900x900>", medium: "300x300>", small: "80x80#", thumb: "30x30#" }, default_url: "/images/generic_profile.jpeg"
  validates_attachment_content_type :main_image, content_type: /\Aimage\/.*\z/
  belongs_to :user
  has_many :favorites
  has_many :contributions
  has_many :users, through: :contributions
  has_many :promises
  has_many :users, through: :favorites
  has_many :project_categories
  has_many :categories, through: :project_categories
  has_many :favorited_by, through: :favorites, source: :user


  validates :title, presence: true
  validates :description, presence: true
  validates :goal, presence: true
  validates :duration, presence: true
  validates :goal, numericality: { greater_than: 0 }
end
