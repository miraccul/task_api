class TodosController < ApplicationController
    layout false
    skip_before_action :verify_authenticity_token

    def create
        if params[:title]
            @category = Category.new
            @category.title = params[:title]
            @category.save
            @category_id = Category.find_by(title: params[:title]).id
        else
            @category_id = params[:id]   
        end
        @task = Task.new
        @task.category_id = @category_id
        @task.text = params[:text]
        @task.isComplited = false
        if @task.save
            render json: @task, status: :created
        else
            render json: @task.errors, status: :unprocessable_entity
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
