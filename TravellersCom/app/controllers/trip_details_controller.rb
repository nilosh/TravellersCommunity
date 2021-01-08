class TripDetailsController < InheritedResources::Base
  before_action :authenticate_user!
  actions :index, :show, :new, :create, :destroy

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

  def search
    User.joins(:trip_details)
    @trip_detail = TripDetail.search(params[:search])

    # if :start_date.present?
    #   @trip_detail = @trip_detail.where(:startDate => "%#{:start_date}%") if :start_date.present?
    # end

    if :start_date.blank?
      prev_search = params[:search]
      @trip_detail = @trip_detail.where(:location => prev_search).where(:startDate => "%#{:start_date}%")
    end
    
    # @trip_detail = TripDetail.where("endDate LIKE ?", :end_date) if :end_date.present?
    # @trip_detail = @trip_detail.where("endDate LIKE ?", :endDate) if :end_date.present?
    # @creator = User.find_by(:gender)
    # @trip_detail = @trip_detail.where("gender LIKE ?", :gender) if :gender != "Any"
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
