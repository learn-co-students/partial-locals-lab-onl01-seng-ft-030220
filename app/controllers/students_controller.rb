class StudentsController < ApplicationController

  def index 
    if params[:query]
      @students = Student.search(params[:query]).order("created_at DESC")
    else
      @students = Student.all.order('created_at DESC')
    end
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student
    else
      render 'new'
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def show
    @student = Student.find(params[:id])
  end

  private

  def student_params
    params.require(:student).permit(:name, :birthday, :hometown)
  end

end
