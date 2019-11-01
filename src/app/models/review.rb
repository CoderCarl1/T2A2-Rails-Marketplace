class Review < ApplicationRecord
  belongs_to :customer_id, class_name: 'User'
  belongs_to :tattoos
end
