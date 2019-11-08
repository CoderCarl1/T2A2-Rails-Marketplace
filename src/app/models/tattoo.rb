class Tattoo < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  def can_edit?(user)
    return user && (user == self.user || user.has_role?(:admin))  
  end
end
