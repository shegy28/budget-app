class User < ApplicationRecord
    has_many :expenses, dependent: :destroy
    has_many :groups, dependent: :destroy

    validates :name, presence: true, length: { in: 3..50 }

end
