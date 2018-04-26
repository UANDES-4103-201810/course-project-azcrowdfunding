class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class User < ApplicationRecord
  validates :first_name, presence: true, length: { minimum: 2}
  validates :last_name, presence:true, length: {minimum: 2}
  validates :email, presence: true, email: true
  validates :phone, length: { is: 9 }
  validates :address, presence: true, length: { minimum: 4}
  validates :country, presence: true, length: {minimum: 3}
  validates :city, presence: true, length: {minimum: 3}
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :username, length: { minimum: 6 }
  validates :username, length: { maximum: 25 }
  validates :password, length: { minimum: 6 }
  validates :password, length: { maximum: 25 }
  validates :security_question, presence: true
  validates :answer, presence: true
  has_many :favorites
  has_many :projects
  has_many :projects, through: :favorites
  has_many :contributions
  has_many :projects, through: :contributions
  has_many :finance
  has_many :promises, through: :finance
end
