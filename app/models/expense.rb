class Expense < ApplicationRecord
  has_and_belongs_to_many :groups
  belongs_to :author, class_name: 'User'

  validates :name, presence: true, length: { minimum: 2 }
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
