class PagesController < ApplicationController
  def landing
  end

  def delete_image_attachment
    @user.images.find_by(params[:attachment_id]).purge
  end


end
