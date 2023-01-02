class ApartmentsController < ApplicationController
    
    def index
        apartment=Apartment.all
        render json: apartment
    end

    def show
        apartment=Apartment.find_by(params[:id])
        render json: apartment
    end

    def create
        apartment=Apartment.create(apartment_params)
        if apartment.valid?
        render json: apartment, status: :created
        else 
            render json: {error: ["make sure you have an apt number"]}
        end
    end

    def update
        apartment=Apartment.find_by(id:params[:id])
        if apartment
            apartment.update(apartment_params)
            render json: apartment
        else
            render json: { error: "Apartment not found, cannot update"}
        end
    end

    def destroy
        apartment=Apartment.find_by(id: params[:id])
        if apartment
            apartment.destroy
            head :no_content
        else
            render json: { error: "Apartment not found"} 
        end

    end

    private

    def apartment_params
        params.permit(:number)
    end

end