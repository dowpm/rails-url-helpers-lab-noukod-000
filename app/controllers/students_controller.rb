class StudentsController < ApplicationController
  before_action :set_student, only: :show

  def index
    @students = Student.all
  end

  def show
    set_student
  end

  def activate
    set_student
    if @student.active
      @student.active = false
    else
      @student.active = true
    end
    @student.save
    redirect_to show
  end

  def to_s
    first_name+" "+ last_name
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end
