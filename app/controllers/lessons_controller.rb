class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_lesson, only: [:show]

  def show
  end

  private

  def require_authorized_for_current_lesson
    if current_user.enrolled_in?(current_lesson.section.course)
      
    else
      redirect_to course_path(current_course), alert: "Not enrolled"

    end
  end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end

  
  def current_course
    @current_course ||= current_lesson.section.course
  end

end
