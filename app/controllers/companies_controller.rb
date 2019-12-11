class CompaniesController < ApplicationController

  def new
    render :new
  end

  def create
    company_name = company_params["company_name"]
    company = Company.find_by(company_name: company_name)
    # If a company does not exist, create it, save it to the db,
    # and update the user's company id
    if company.nil?
      company = Company.new(company_params)
      if company.save
        current_user.update(company_id: company.id)
        redirect_to openings_url
      else
        flash.now[:errors] = company.errors.full_messages
        render :new
      end
    # If a company already exists, simply update the user to include
    # the company id
    else
      current_user.update(company_id: company.id)
      redirect_to openings_url
    end
  end

  def index
    @companies = Company.all
    render json: @companies
  end

  private

  def company_params
    params.require(:company).permit(:company_name)
  end

end
