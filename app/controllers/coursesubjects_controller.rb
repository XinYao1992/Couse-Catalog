class CoursesubjectsController < ApplicationController
  before_action :set_coursesubject, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  # GET /coursesubjects
  # GET /coursesubjects.json
  def index
    @coursesubjects = Coursesubject.all
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
