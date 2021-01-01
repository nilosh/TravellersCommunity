class TripDetailsController < InheritedResources::Base

  private

    def trip_detail_params
      params.require(:trip_detail).permit(:location, :startDate, :endDate, :description, 
        :user_id => current_user.id )
    end

end
