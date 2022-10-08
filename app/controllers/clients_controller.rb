class ClientsController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def show
        client = Client.find(params[:id])
        render json: client, methods: [:membership_summary], status: :ok
    end


end
