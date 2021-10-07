class ProjectsController < ApplicationController
    layout false
    skip_before_action :verify_authenticity_token
    def index
        @categories = Category.all
        render json: @categories.as_json(only: [:id, :title], include: :task)
    end
end
