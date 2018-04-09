class Promise < ApplicationRecord
  belongs_to :project
  has_many :finances
end
