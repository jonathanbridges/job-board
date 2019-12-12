class OpeningsController < ApplicationController

  before_action :require_login!
  
  def create
    @opening = Opening.new(opening_params)
    @opening.company_id = current_user.company_id
    if @opening.save
      redirect_to openings_url
    else
      flash.now[:errors] = @opening.errors.full_messages
      render :new
    end
  end

  def index
    company_id = current_user.company_id
    # renders an index of all openings for applicants,
    # but for employers, only openings from their own company
    @openings = company_id ? Opening.where(company_id: company_id) : Opening.all
    render :index
  end

  def edit
    @opening = Opening.find(params[:id])
  end

  def update
    @opening = Opening.find(params[:id])
    if @opening.update_attributes(opening_params)
      redirect_to openings_url
    else
      flash.now[:errors] = @opening.errors.full_messages
      render :edit
    end
  end

  private

  def opening_params
    params.require(:opening).permit(:company_id, :title, :description)
  end

end
