require "test_helper"

class CoursesubjectsControllerTest < ActionController::TestCase
  def coursesubject
    @coursesubject ||= coursesubjects :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:coursesubjects)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("Coursesubject.count") do
      post :create, coursesubject: { course_code: coursesubject.course_code, course_name: coursesubject.course_name, subject_id: coursesubject.subject_id }
    end

    assert_redirected_to coursesubject_path(assigns(:coursesubject))
  end

  def test_show
    get :show, id: coursesubject
    assert_response :success
  end

  def test_edit
    get :edit, id: coursesubject
    assert_response :success
  end

  def test_update
    put :update, id: coursesubject, coursesubject: { course_code: coursesubject.course_code, course_name: coursesubject.course_name, subject_id: coursesubject.subject_id }
    assert_redirected_to coursesubject_path(assigns(:coursesubject))
  end

  def test_destroy
    assert_difference("Coursesubject.count", -1) do
      delete :destroy, id: coursesubject
    end

    assert_redirected_to coursesubjects_path
  end
end
