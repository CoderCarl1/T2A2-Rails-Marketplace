class Transaction < ApplicationRecord
  belongs_to :customer_id, class_name: 'User'
  belongs_to :artist_id, class_name: 'User'

  has_many :reviews
  has_many :images
end
