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
    @trip_detail = TripDetail.search(params[:search])
    if !params[:keywords].blank?
      @trip_detail = TripDetail.where(["location ILIKE ?", params[:keywords]])
      @trip_detail = @trip_detail.where(["trip_details.startDate LIKE ?", params[:start_date]]) if params[:start_date].present?
      @trip_detail = @trip_detail.where(["trip_details.endDate LIKE ?", params[:end_date]]) if params[:end_date].present?
      if params[:gender].present?
        if params[:gender] == "Male" || params[:gender] == "Female"
          if params[:gender] == "Male"
            @trip_detail = @trip_detail.joins(:user).where(users: {gender: 1})
          else
            @trip_detail = @trip_detail.joins(:user).where(users: {gender: 2})
          end
        end
      else
        @trip_detail = @trip_detail.joins(:user).where(users: {gender: "1"}).where(users:{gender: "2"})
      end
    else
      @trip_detail = TripDetail.search(params[:search])
    end
  end

  private
    def trip_detail_params
      params.require(:trip_detail).permit(:location, :startDate, :endDate, :description, :photos => []).
      merge(:user_id => current_user.id)
    end

    def filter_params
      params.permit(:keywords, :start_date, :end_date, :gender)
    end

end
