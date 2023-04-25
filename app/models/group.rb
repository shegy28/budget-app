class Group < ApplicationRecord
  has_and_belongs_to_many :expenses
  belongs_to :author, class_name: 'User'

  validates :name, presence: true, length: { minimum: 3, too_short: 'Group name must be more than 3 characters long' }
end
