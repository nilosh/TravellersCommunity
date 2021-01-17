class PagesController < ApplicationController
  before_action :authenticate_user!
  
  # This method handles the data queries to display the users list for a user
  # in their home page.
  def home
    @trip_details = TripDetail.all.with_attached_photos
    @users = User.where(:role_id => 2)
    @following = UserRelationship.where(followee_id: "%#{current_user.id}%").all
  end
 
end
