class LeasesController < ApplicationController
    def create 
        lease=Lease.create(lease_params)
        if lease.valid?
        render json: lease
        else
            render json: {error: ["your lease data has some problems"]}
        end
    end

    def destroy
        lease=Lease.find_by(id:params[:id])
        if lease
            lease.destroy
            head :no_content
        else
            render json: {error: ["that lease cannot be found"]}
        end
    end
    private
    def lease_params
        params.permit(:apartment_id, :tenant_id, :rent)
    end
end
