module ApplicationHelper
  def gender_lists 
    I18n.t(:gender_lists).map { |key, value| [ value, key ] } 
  end

  def user_avatar(user)
    if user.avatar.attached? 
      user.avatar.attachment
    else
      'default_avatar.png'
    end
  end

end
