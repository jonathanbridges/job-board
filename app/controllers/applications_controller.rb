class ApplicationsController < ApplicationController

  def create
    @application = Application.new(application_params)
    if @application.save
      redirect_to openings_url
    else
      flash.now[:errors] = @application.errors.full_messages
      redirect_to openings_url
    end
  end

  def index
    @applications = Application.all
    render :index
  end

  private

  def application_params
    params.require(:application).permit(:applicant_id, :opening_id)
  end

end
