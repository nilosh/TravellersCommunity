class TripDetail < ApplicationRecord
  belongs_to :user
  has_many :reviews,  :dependent => :destroy
  has_many_attached :photos,  :dependent => :destroy
end
