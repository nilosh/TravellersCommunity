class UserRelationshipsController < ApplicationController
  include Pagy::Backend
  before_action :authenticate_user!

  def create
    other_user = User.find(params[:devise_id])
    @relationship = UserRelationship.new(follower_id: current_user.id, followee_id: other_user.id)
    
    @relationship.save
    redirect_to user_path(other_user)
  end

  def destroy
    @relationship = UserRelationship.find(params[:id])
    @relationship.destroy
    redirect_to user_path(@relationship.followee_id)
  end

  def _following
    set_tab :following
    @followings = UserRelationship.where(:follower_id => current_user.id).all
  end

  def _followers
    set_tab :followers
    @followers = UserRelationship.where(:followee_id => current_user.id).all
  end
  
end
