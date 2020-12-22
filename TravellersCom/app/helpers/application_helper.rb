module ApplicationHelper
  def gender_lists 
    I18n.t(:gender_lists).map { |key, value| [ value, key ] } 
  end

  def user_avatar(user, size=50)
    if user.avatar.attached? 
      user.avatar.variant(resize: "#{size}×#{size}!")
    else
      image_tag 'default_avatar.png', size: size
    end
  end

end
