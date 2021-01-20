json.extract! trip_detail, :id, :location, :start, :end, :description, :user_id, :created_at, :updated_at
json.url trip_detail_url(trip_detail, format: :json)
