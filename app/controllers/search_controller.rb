class SearchController < ApplicationController
  before_action :require_login

  def index
    @subjects = Subject.all
    @subjects_name_id = {}
    @coursesubjects = nil
    @subjects.each do |subject|
      @subjects_name_id[subject.name] = subject.id
    end

    if params[:course_name] != nil and params[:course_name] != ""
      if params[:subject_id] != ""
        @coursesubjects = Coursesubject.where(course_name:params[:course_name].to_s, subject_id:params[:subject_id].to_s)
      else
        @coursesubjects = Coursesubject.where(course_name:params[:course_name])
      end
    end

  end

end
