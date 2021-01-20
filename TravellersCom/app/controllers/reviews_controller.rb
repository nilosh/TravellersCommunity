class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_trip_detail
  before_action :find_review, only: [:edit, :update, :destroy]

  # This class defines CRUD Operations for handling user reviews on trip details.
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.trip_detail_id = @trip_detail.id
    @review.user_id = current_user.id
    if @review.save
      redirect_to trip_detail_path(@trip_detail)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to trip_detail_path(@trip_detail)
    else
      render 'edit'
    end
  end

  def destroy
    @review.destroy
    redirect_to trip_detail_path(@trip_detail)
  end

  private
    def review_params
      params.require(:review).permit(:rating, :review)
    end

    def find_trip_detail
      @trip_detail = TripDetail.find(params[:trip_detail_id])
    end

    def find_review
      @review = Review.find(params[:id])
    end

end
