class User < ApplicationRecord
    has_many :expenses, dependent: :destroy
    has_many :groups, dependent: :destroy
end
