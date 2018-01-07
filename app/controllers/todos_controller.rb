class TodosController < ApplicationController
  before_action :set_todo, :only => [:show, :edit, :update, :destroy, :check]
  # 透過 before_action 來篩選指定動作，我們稱之為 過濾器 (Filter)。除了 before_action 之外，Rails 也提供 around_action 和 after_action 來讓我們來定義進入 action 之中或之後來執行特定的方法。其中 before_action 最為常用。
  # 
  # before_action 也可以是回呼方法 (Callback Method) 的一種。除了針對 Controller 之外，也有針對 Model (也就是 Active Record) 的 Callback Method. 我們會在後來的章節，跟大家介紹。關於 Active Record 的 Callback Method，你可以參考官方指南。
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

  # def show
  #   @todo=Todo.find(params[:id])
    
  # end

  # def edit
  #   @todo=Todo.find(params[:id])
    
  # end

  def update
    # @todo=Todo.find(params[:id])
    if @todo.update_attributes(todo_params)

      redirect_to todo_url(@todo)
    else
      render :action => :edit
    end
  end

  def destroy
    # @todo=Todo.find(params[:id])
    @todo.destroy

    redirect_to todos_url
    
  end

  def check
    # @todo=Todo.find(params[:id])
    @todo.update(checkbox: !(@todo.checkbox))
    
  end
private
  def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:title,:due_date,:description)
  
  end

end
