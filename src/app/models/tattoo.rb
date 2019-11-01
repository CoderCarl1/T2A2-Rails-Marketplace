class Tattoo < ApplicationRecord
  belongs_to :customer_id
  belongs_to :artist_id
end
