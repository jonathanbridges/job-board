class UsersController < ApplicationController
  
  skip_before_action :verify_authenticity_token

  def new
    @user = User.new
  end

   def create
    @user = User.new(user_params)

    if @user.save
      login(@user)
      if @user.is_employer
        redirect_to new_company_url
      else
        redirect_to openings_url
      end
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def index 
    @users = User.all
    render json: @users
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :is_employer, :password)
  end

end
