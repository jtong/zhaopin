class MyPostedKataController < ApplicationController
  # GET /my_posted_kata
  # GET /my_posted_kata.json
  def index
    @my_posted_kata = MyPostedKatum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @my_posted_kata }
    end
  end

  # GET /my_posted_kata/1
  # GET /my_posted_kata/1.json
  def show
    @my_posted_katum = MyPostedKatum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @my_posted_katum }
    end
  end

  # GET /my_posted_kata/new
  # GET /my_posted_kata/new.json
  def new
    @my_posted_katum = MyPostedKatum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @my_posted_katum }
    end
  end

  # GET /my_posted_kata/1/edit
  def edit
    @my_posted_katum = MyPostedKatum.find(params[:id])
  end

  # POST /my_posted_kata
  # POST /my_posted_kata.json
  def create
    @my_posted_katum = MyPostedKatum.new(params[:my_posted_katum])

    respond_to do |format|
      if @my_posted_katum.save
        format.html { redirect_to @my_posted_katum, notice: 'My posted katum was successfully created.' }
        format.json { render json: @my_posted_katum, status: :created, location: @my_posted_katum }
      else
        format.html { render action: "new" }
        format.json { render json: @my_posted_katum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /my_posted_kata/1
  # PUT /my_posted_kata/1.json
  def update
    @my_posted_katum = MyPostedKatum.find(params[:id])

    respond_to do |format|
      if @my_posted_katum.update_attributes(params[:my_posted_katum])
        format.html { redirect_to @my_posted_katum, notice: 'My posted katum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @my_posted_katum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my_posted_kata/1
  # DELETE /my_posted_kata/1.json
  def destroy
    @my_posted_katum = MyPostedKatum.find(params[:id])
    @my_posted_katum.destroy

    respond_to do |format|
      format.html { redirect_to my_posted_kata_url }
      format.json { head :no_content }
    end
  end
end
