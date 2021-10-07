class TodosController < ApplicationController
    layout false
    skip_before_action :verify_authenticity_token

    def create
        if params[:title] && params[:text]
            @category = Category.where(:title => params[:title]).first_or_create(title: params[:title])
            @category_id = @category[:id]
            Task.create(category_id: @category_id, text: params[:text], isComplited: false)
            render json: @category.as_json(include: :task), status: :created
        elsif params[:category_id] && params[:text]
            @task = Task.create(category_id: params[:category_id], text: params[:text], isComplited: false)
            render json: @task.as_json
        end
    end

    def update
       @task = Task.find(params[:id])
       @task.isComplited = !@task.isComplited
       if @task.save
            render json: @task
       else 
            render json: @task.errors, status: :unprocessable_entity
       end
    end
end
