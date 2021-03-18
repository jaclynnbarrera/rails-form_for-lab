class StudentsController < ApplicationController

    def index
        @students = Student.all
    end
       
    def create
        @student = Student.new(student_params(:first_name, :last_name))
        @student.save
        redirect_to student_path(@student)
    end
    
    def new 
        @student = Student.new
    end
    
    def show
        @student = Student.find(params[:id])
    end
    
    def edit
        @student = Student.find(params[:id])
    end
       
    def update
        @student = Student.find(params[:id])
        @student.update(student_params(:first_name, :last_name))
        #.require excapsulates title and description within a post hash
        redirect_to student_path(@student)
    end
    
    private
    #implemented strong params here
    def student_params(*args)
      params.require(:student).permit(*args)
    end 
    
end