#separate controller for api end points, all api end points will be inherited by api controller
class Api::V1::CompaniesController < ApiController

    before_action :set_company, only: [:show]

    def index 
        # @companies=Company.all
        @companies = current_user.companies
    end

    def show 
        render json: @company, status: :ok
    end


    private

    def set_company 
        @company=Company.find(params[:id])
        @company = current_user.companies.find(params[:id])
    rescue ActiveRecord::RecordNotFound => error
        render json: error.message,status: :unauthorized
    end
end