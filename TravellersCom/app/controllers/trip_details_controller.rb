class TripDetailsController < InheritedResources::Base
  before_action :authenticate_user!
  actions :index, :show, :new, :create, :destroy

  # CRUD Operations for trip details.

  def index
    @trip_detail = TripDetail.new
    super
  end

  def show
    @trip_detail = TripDetail.find(params[:id])
    add_breadcrumb("#{@trip_detail.user.full_name} - #{@trip_detail.location}")
    @review = Review.new

    if @trip_detail.reviews.blank?
      @avg_review = 0
    else
      @avg_review = @trip_detail.reviews.average(:rating).round(2)
    end 
  end

  # Queries for search and filters.
  def search
    User.joins(:trip_details)
    @trip_detail = TripDetail.search(params[:search])

    if :start_date.blank?
      prev_search = params[:search]
      @trip_detail = @trip_detail.where(:location => prev_search).where(:startDate => "%#{:start_date}%")
    end

  end

  private

    def trip_detail_params
      params.require(:trip_detail).permit(:location, :startDate, :endDate, :description, :photos => []).
      merge(:user_id => current_user.id)
    end

    def filter_params
      params.permit(:start_date, :end_date, :gender)
    end

end
