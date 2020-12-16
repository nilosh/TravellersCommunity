class User < ApplicationRecord
  before_save :set_default_user

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def set_default_user
    if self.new_record?
      self.role_id ||= 2
    end
  end

  # enum role: [:standard, :premium, :admin]

  # Initialize new user with standard role by default.
  # after_initialize do
  #   if self.new_record?
  #     self.role ||= :standard
  #   end
  # end
end
