class ProjectsController < ApplicationController
    layout false
    skip_before_action :verify_authenticity_token
    def index
        @categories = Category.all
        render json: @categories.map {|i| {id: i.id, title: i.title, todos: Task.where(category_id: i.id).select("id","text","isComplited")}}
    end
end
