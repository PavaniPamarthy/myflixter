class Instructor::PhotosController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_course

  def create
     @photo = current_course.photos.create(photo_params.merge(user: current_user))
     redirect_to instructor_course_path(current_course)
  end

  private

  def require_authorized_for_current_course
    if current_course.user != current_user
      render plain: "Unauthorized", status: :unauthorized
    end
  end

  helper_method :current_course
  def current_course
    @current_course ||= Course.find(params[:course_id])
  end

  def photo_params
    params.require(:image)
  end
end
