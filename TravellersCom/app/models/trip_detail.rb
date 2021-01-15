class TripDetail < ApplicationRecord
  belongs_to :user
  has_many :reviews,  :dependent => :destroy
  has_many_attached :photos,  :dependent => :destroy

  #  Nav-bar search
  def self.search(search)
    if search
      where(["location ILIKE ?", "%#{search}%"])
    else
      all
    end
  end

end
