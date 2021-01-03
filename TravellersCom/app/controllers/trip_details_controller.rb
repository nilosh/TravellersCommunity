class TripDetailsController < InheritedResources::Base

  actions :index, :show, :new, :create, :destroy

  def index
    @trip_detail = TripDetail.new
    super
  end

  def show
    @trip_detail = TripDetail.find(params[:id])
    add_breadcrumb(@trip_detail)
    @review = Review.new
  end

  private

    def trip_detail_params
      params.require(:trip_detail).permit(:location, :startDate, :endDate, :description, photos: []).
      merge(:user_id => current_user.id)
    end

end
