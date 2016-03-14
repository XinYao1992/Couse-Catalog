require "test_helper"

class CoursesControllerTest < ActionController::TestCase
  def course
    @course ||= courses :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:courses)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("Course.count") do
      post :create, course: { code: course.code, course_id: course.course_id, name: course.name }
    end

    assert_redirected_to course_path(assigns(:course))
  end

  def test_show
    get :show, id: course
    assert_response :success
  end

  def test_edit
    get :edit, id: course
    assert_response :success
  end

  def test_update
    put :update, id: course, course: { code: course.code, course_id: course.course_id, name: course.name }
    assert_redirected_to course_path(assigns(:course))
  end

  def test_destroy
    assert_difference("Course.count", -1) do
      delete :destroy, id: course
    end

    assert_redirected_to courses_path
  end
end
