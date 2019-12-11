class SessionsController < ApplicationController
  
  skip_before_action :verify_authenticity_token

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if user
      login(user)
    else
      flash.now[:errors] = ['Invalid username or password']
      render :new
    end
  end

  def destroy
    user = current_user
    if user
      log_out
      redirect_to new_session_url
    end
  end

end
