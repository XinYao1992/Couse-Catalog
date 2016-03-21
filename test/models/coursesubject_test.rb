require "test_helper"

class CoursesubjectTest < ActiveSupport::TestCase
  def coursesubject
    @coursesubject ||= Coursesubject.new
  end

  def test_valid
    assert coursesubject.valid?
  end
end
