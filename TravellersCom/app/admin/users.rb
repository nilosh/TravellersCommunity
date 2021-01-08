ActiveAdmin.register User do
  permit_params :full_name, :gender, :dob, :email

  index do
    selectable_column
    id_column
    column :full_name
    column :gender
    column :dob
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :full_name
  filter :gender
  filter :dob
  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :full_name
      f.input :gender
      f.input :dob
      f.input :email
    end
    f.actions
  end

end
