class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class PersonalInfo < ApplicationRecord
  belongs_to :user
  validates :first_name, presence: true
  validates :email, presence: true, email: true
  validates :phone, length: { is: 9 }
  after_create :init

  def init
    self.last_mod = DateTime.now
  end

end
