ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  # Dashboard item for recent trips created by users.
  content title: proc { I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Recent Trips" do
          ul do
            TripDetail.limit(5).map do |post|
              li link_to(post.location, admin_trip_detail_path(post))
            end
          end
        end
      end
    end

    # Dashboard items for recently joined users.
    columns do
      column do
        panel "Recently joined Users" do
          ul do
            User.limit(5).map do |user|
              li link_to(user.full_name, admin_user_path(user))
            end
          end
        end
      end
    end

  end
  
end
