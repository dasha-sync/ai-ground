module ApplicationHelper
  def user_avatar
    if current_user.avatar_url.present?
      current_user.avatar_url
    else
      "blank-profile-picture-973460_1280.png"
    end
  end
end
