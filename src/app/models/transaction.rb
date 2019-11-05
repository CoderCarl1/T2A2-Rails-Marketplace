class Transaction < ApplicationRecord
  belongs_to :user

  has_many :reviews
  has_many :images
end
