class CustomControllerController < ApplicationController
  def index
    @projects = Project.all
    @todos = Todo.all
  end

  def update
    @u_todo = Todo.find(params['id'])
    @u_todo.toggle(:is_completed)
    @u_todo.save!
    redirect_to '/'
  end

  def create
    if params['text'] != '' || params['project_id'] != -1
      Todo.create(text: params['text'], project_id: params['project_id'])
    end
    redirect_to '/'
  end
end
