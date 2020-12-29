class User < ApplicationRecord
  before_save :set_default_user

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar, dependent: :destroy
  has_many_attached :images, dependent: :destroy


  def set_default_user
    if self.new_record?
      self.role_id ||= 2
    end
  end

  def photo_thumbnail input
    return self.images[input].variant(resize: '300x300!').processed
  end


  # enum role: [:standard, :premium, :admin]

  # Initialize new user with standard role by default.
  # after_initialize do
  #   if self.new_record?
  #     self.role ||= :standard
  #   end
  # end
end
