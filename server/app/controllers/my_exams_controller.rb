class MyExamsController < ApplicationController
  # GET /my_exams
  # GET /my_exams.json
  def index
    @my_exams = MyExam.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @my_exams }
    end
  end

  # GET /my_exams/1
  # GET /my_exams/1.json
  def show
    @my_exam = MyExam.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @my_exam }
    end
  end

  # GET /my_exams/new
  # GET /my_exams/new.json
  def new
    @my_exam = MyExam.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @my_exam }
    end
  end

  # GET /my_exams/1/edit
  def edit
    @my_exam = MyExam.find(params[:id])
  end

  # POST /my_exams
  # POST /my_exams.json
  def create
    @my_exam = MyExam.new(params[:my_exam])

    respond_to do |format|
      if @my_exam.save
        format.html { redirect_to @my_exam, notice: 'My exam was successfully created.' }
        format.json { render json: @my_exam, status: :created, location: @my_exam }
      else
        format.html { render action: "new" }
        format.json { render json: @my_exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /my_exams/1
  # PUT /my_exams/1.json
  def update
    @my_exam = MyExam.find(params[:id])

    respond_to do |format|
      if @my_exam.update_attributes(params[:my_exam])
        format.html { redirect_to @my_exam, notice: 'My exam was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @my_exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my_exams/1
  # DELETE /my_exams/1.json
  def destroy
    @my_exam = MyExam.find(params[:id])
    @my_exam.destroy

    respond_to do |format|
      format.html { redirect_to my_exams_url }
      format.json { head :no_content }
    end
  end
end
