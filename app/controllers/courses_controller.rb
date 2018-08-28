class CoursesController < ApplicationController
  def show
    @course = Course.find(params[:id])
    @student_count = @course.student_count
  end
end
