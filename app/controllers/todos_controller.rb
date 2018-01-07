class TodosController < ApplicationController
  def index
    @todos = Todo.all
    
  end

  def new
    @todo = Todo.new
    
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to todos_url
    else
      render :action => :new
    end
  end

  def show
    @todo=Todo.find(params[:id])
    
  end

  def edit
    @todo=Todo.find(params[:id])
    
  end

  def update
    @todo=Todo.find(params[:id])
    if @todo.update_attributes(todo_params)

      redirect_to todo_url(@todo)
    else
      render :action => :edit
    end
  end

  def destroy
    @todo=Todo.find(params[:id])
    @todo.destroy

    redirect_to todos_url
    
  end

  def check
    @todo=Todo.find(params[:id])
    @todo.update(checkbox: !(@todo.checkbox))
    
  end
private
  
  def todo_params
    params.require(:todo).permit(:title,:due_date,:description)
  
  end

end
