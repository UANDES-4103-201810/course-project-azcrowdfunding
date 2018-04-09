class User < ApplicationRecord
  has_many :projects
  has_one :personal_info
  has_one :credential
  has_many :favorites
  has_many :contributions
  has_many :finances


  accepts_nested_attributes_for :personal_info
end
