class PagesController < ApplicationController
  before_action :authenticate_user!
  
  def home
    @trip_details = TripDetail.all.with_attached_photos
  end

  # def show
  #   @user = User.find(params[:id])
  #   super
  # end

  # def profile
  #   @user = User.find params[:id]
  # end

  def delete_image_attachment
    @user.images.find_by(params[:attachment_id]).purge
  end


end
