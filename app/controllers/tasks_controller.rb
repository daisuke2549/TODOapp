class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end
  



end

