class Tattoo < ApplicationRecord
  belongs_to :user
  has_many_attached :images
 validates :title, presence: true
 validates :description, presence: true
 validate :image_type
  # def thumb input
  #   return self.images[input].variant(resize: '200x200!').processed
  # end
  def can_edit?(user)
    return user && (user == self.user || user.has_role?(:admin))  
  end

  private
  def image_type
    if images.attached? == false
      errors.add(:images, "are missing!")
    end
    images.each do |image|
      if !image.content_type.in?(%('image/jpeg image/png'))
        errors.add(:images, 'needs to be a JPEG or PNG')
      end
    end
  end

  
end
