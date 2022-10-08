class MembershipsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_unprocessable_entity_response

    def create 
        if Membership.find_by(gym_id: params[:gym_id], client_id: params[:client_id])
            render json: {message: "Membership already exists"}, status: :unprocessable_entity
        else
            membership = Membership.create!(membership_params)
            render json: membership, status: :created
        end
    end

    private

    def membership_params
        params.permit(:gym_id, :client_id, :charge)
    end

    def render_unprocessable_entity_response(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end
end
