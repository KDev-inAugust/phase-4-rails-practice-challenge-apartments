class TenantsController < ApplicationController

    def index
        tenant=Tenant.all
        render json: tenant
    end

    def show
        tenant=Tenant.find_by(params[:id])
        render json: tenant
    end

    def create
        tenant=Tenant.create(tenant_params)
        if tenant.valid?
            render json: tenant, status: :created
        else
            render json: {error: ["your tenant needs valid info to be entered"]}
        end
    end

    def update
        tenant=Tenant.find_by(id:params[:id])
        if tenant
            tenant.update(tenant_params)
            render json: tenant
        else
            render json: {error: ["can't find that tenant"]}
        end
    end

    def destroy
        tenant=Tenant.find_by(id: params[:id])
        if tenant
            tenant.destroy
            head :no_content
        else
            render json: {error: "Tenant not found"}
        end
    end



    private

    def tenant_params
        params.permit(:name, :age)
    end
end
