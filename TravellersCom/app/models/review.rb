class Review < ApplicationRecord
  belongs_to :user
  belongs_to :trip_detail
end
