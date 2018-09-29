class CustomControllerController < ApplicationController
  def index
    @projects = Project.all
    @todos = Todo.all
    redirect_to'/'
  end

  def update
    @u_todo = Todo.find(params["todo"]["id"])
    @u_todo.toggle(:is_completed)
    @u_todo.save!
    redirect_to'/'
  end

  def create
    # if params['text'] != '' || params['project_id'] != -1
    Todo.create(text: params['todo']['text'], project_id: params['todo']['project_id'])
    # end
    respond_to do |format|
      format.html
      format.json { render :json => @todos.to_json }
    end
  end
end
