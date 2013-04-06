class MyPostedHomeworksController < ApplicationController
  before_filter :admin_authenticate

  # GET /my_posted_homeworks
  # GET /my_posted_homeworks.json
  def index
    @my_posted_homeworks = MyPostedHomework.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @my_posted_homeworks }
    end
  end

  # GET /my_posted_homeworks/1
  # GET /my_posted_homeworks/1.json
  def show
    @my_posted_homework = MyPostedHomework.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @my_posted_homework }
    end
  end

  # GET /my_posted_homeworks/new
  # GET /my_posted_homeworks/new.json
  def new
    @my_posted_homework = MyPostedHomework.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @my_posted_homework }
    end
  end

  # GET /my_posted_homeworks/1/edit
  def edit
    @my_posted_homework = MyPostedHomework.find(params[:id])
  end

  # POST /my_posted_homeworks
  # POST /my_posted_homeworks.json
  def create
    @my_posted_homework = MyPostedHomework.new(params[:my_posted_homework])

    respond_to do |format|
      if @my_posted_homework.save
        format.html { redirect_to @my_posted_homework, notice: 'My posted homework was successfully created.' }
        format.json { render json: @my_posted_homework, status: :created, location: @my_posted_homework }
      else
        format.html { render action: "new" }
        format.json { render json: @my_posted_homework.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /my_posted_homeworks/1
  # PUT /my_posted_homeworks/1.json
  def update
    @my_posted_homework = MyPostedHomework.find(params[:id])

    respond_to do |format|
      if @my_posted_homework.update_attributes(params[:my_posted_homework])
        format.html { redirect_to @my_posted_homework, notice: 'My posted homework was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @my_posted_homework.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my_posted_homeworks/1
  # DELETE /my_posted_homeworks/1.json
  def destroy
    @my_posted_homework = MyPostedHomework.find(params[:id])
    @my_posted_homework.destroy

    respond_to do |format|
      format.html { redirect_to my_posted_homeworks_url }
      format.json { head :no_content }
    end
  end
end
