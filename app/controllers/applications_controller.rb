class ApplicationsController < ApplicationController

  def create
    @application = Application.new(opening_params)
    if @application.save
      redirect_to openings_url
    else
      flash.now[:errors] = @application.errors.full_messages
      redirect_to openings_url
    end
  end

  def index
    @applications = Application.where(company_id: current_user.company_id)
    render :index
  end

end
