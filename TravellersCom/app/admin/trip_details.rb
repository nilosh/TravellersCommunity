ActiveAdmin.register TripDetail do
  permit_params :location, :startDate, :endDate, :description, :photos
end