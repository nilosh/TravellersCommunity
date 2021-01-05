class User < ApplicationRecord
  before_save :set_default_user

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many_attached :images

  has_many :trip_details, :dependent => :destroy
  has_many :reviews, :dependent => :destroy

  has_many :following, foreign_key: "follower_id", class_name: "UserRelationship"
  has_many :followers, foreign_key: "followee_id", class_name: "UserRelationship"


  def show
    @user = User.find(params[:id])
    super
  end

  def set_default_user
    if self.new_record?
      self.role_id ||= 2
    end
  end

  def photo_thumbnail input
    return self.images[input].variant(resize: '300x300!').processed
  end


end
