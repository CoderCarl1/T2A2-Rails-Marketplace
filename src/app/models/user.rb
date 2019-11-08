class User < ApplicationRecord
  rolify
  after_create :assign_default_role


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tattoos, foreign_key: 'artist_id'
  has_many :customers, through: :tattoos
  # has_many :reviews, through: :tattoos


  has_many :tattoos_purchased, class_name: 'Tattoo', foreign_key: 'customer_id'
  has_many :artists, through: :tattoos_purchased

  def assign_default_role
    self.add_role(:user) if self.roles.blank?
  end
end
