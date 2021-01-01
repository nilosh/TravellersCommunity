class TripDetail < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many_attached :photos, dependent: :destroy
end
