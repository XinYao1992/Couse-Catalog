class CoursesubjectsController < ApplicationController
  before_action :set_coursesubject, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  # GET /coursesubjects
  # GET /coursesubjects.json
  def index
    @coursesubjects = Coursesubject.all
  end

  def search
    #@coursesubjects = Coursesubject.all
    @Coursesubject = Coursesubject.all
    @subjects = Subject.all
    @subjects_name_id = {}
    @coursesubjects = nil
    @subjects.each do |subject|
      @subjects_name_id[subject.name] = subject.id
    end
    @subjects_name_id = Subject.all.map {|s| [s.name, s.subject_id]}
  end

  def do_search
    #binding.pry
    if params.fetch(:course_name) != nil and params.fetch(:course_name) != ""
      if params.fetch(:subject_id) != ""
        @coursesubjects = Coursesubject.where(course_name:params.fetch(:course_name).to_s, subject_id:params.fetch(:subject_id).to_s)
      else
        @coursesubjects = Coursesubject.where(course_name:params.fetch(:course_name))
      end
    end
    respond_to do |format|
      format.js
    end
  end

  # GET /coursesubjects/1
  # GET /coursesubjects/1.json
  def show
  end

  # GET /coursesubjects/new
  def new
    @coursesubject = Coursesubject.new
  end

  # GET /coursesubjects/1/edit
  def edit
  end

  # POST /coursesubjects
  # POST /coursesubjects.json
  def create
    @coursesubject = Coursesubject.new(coursesubject_params)

    respond_to do |format|
      if @coursesubject.save
        format.html { redirect_to @coursesubject, notice: 'Coursesubject was successfully created.' }
        format.json { render :show, status: :created, location: @coursesubject }
      else
        format.html { render :new }
        format.json { render json: @coursesubject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coursesubjects/1
  # PATCH/PUT /coursesubjects/1.json
  def update
    respond_to do |format|
      if @coursesubject.update(coursesubject_params)
        format.html { redirect_to @coursesubject, notice: 'Coursesubject was successfully updated.' }
        format.json { render :show, status: :ok, location: @coursesubject }
      else
        format.html { render :edit }
        format.json { render json: @coursesubject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coursesubjects/1
  # DELETE /coursesubjects/1.json
  def destroy
    @coursesubject.destroy
    respond_to do |format|
      format.html { redirect_to coursesubjects_url, notice: 'Coursesubject was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coursesubject
      @coursesubject = Coursesubject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coursesubject_params
      params.require(:coursesubject).permit(:course_code, :course_name, :subject_id)
    end
end
