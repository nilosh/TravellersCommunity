class TripDetail < ApplicationRecord
  belongs_to :user
  has_many :reviews,  :dependent => :destroy
  has_many_attached :photos,  :dependent => :destroy

  def self.search(search)

    if search
      where(["location LIKE ?", "%#{search}%"])
    else
      all
    end

  end

end
