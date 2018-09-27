class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def all
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.persisted?
      sign_in_and_redirect user, success: "You are successfuly sign in!"
    else
      session["devise.user_attributes"] = user.user_attributes
      redirect_to new_user_registration_url
    end
  end

  alias_method :facebook, :all
  alias_method :vkontakte, :all
end