class NimbleshopAuth::UserSessionsController < Devise::SessionsController

  def new
    super
  end

  def create
    authenticate_user!

    if user_signed_in?
      respond_to do |format|
        format.html {
          flash.notice = t(:logged_in_succesfully)
          redirect_back_or_default(root_path)
        }
      end
    else
      flash.now[:error] = t('devise.failure.invalid')
      render :new
    end
  end

  def destroy
    cookies.clear
    session.clear
    super
  end

  private

  def redirect_back_or_default(default)
    redirect_to(session["user_return_to"] || default)
    session["user_return_to"] = nil
  end

end

