require "test_helper"

class SubjectsControllerTest < ActionController::TestCase
  def subject
    @subject ||= subjects :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:subjects)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("Subject.count") do
      post :create, subject: { abbreviation: subject.abbreviation, name: subject.name, subject_id: subject.subject_id }
    end

    assert_redirected_to subject_path(assigns(:subject))
  end

  def test_show
    get :show, id: subject
    assert_response :success
  end

  def test_edit
    get :edit, id: subject
    assert_response :success
  end

  def test_update
    put :update, id: subject, subject: { abbreviation: subject.abbreviation, name: subject.name, subject_id: subject.subject_id }
    assert_redirected_to subject_path(assigns(:subject))
  end

  def test_destroy
    assert_difference("Subject.count", -1) do
      delete :destroy, id: subject
    end

    assert_redirected_to subjects_path
  end
end
