class PagesController < ApplicationController
  before_action :authenticate_user!
  
  def home
    @trip_details = TripDetail.all.with_attached_photos

    @users = User.where(:role_id => 2)
    @following = UserRelationship.where(followee_id: "%#{current_user.id}%").all
    # @fol = User.find_by(params[:id])
  end


  def delete_image_attachment
    @user.images.find_by(params[:attachment_id]).purge
  end

end
