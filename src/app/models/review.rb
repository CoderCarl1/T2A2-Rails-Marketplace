class Review < ApplicationRecord
  belongs_to :customer_id
  belongs_to :tattoo_id
end
