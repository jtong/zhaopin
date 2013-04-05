class KatasController < ApplicationController
  # GET /kata
  # GET /kata.json
  def index
    @katas = Kata.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @katas }
    end
  end

  # GET /kata/1
  # GET /kata/1.json
  def show
    @kata = Kata.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @kata }
    end
  end

  # GET /kata/new
  # GET /kata/new.json
  def new
    @kata = Kata.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @kata }
    end
  end

  # GET /kata/1/edit
  def edit
    @kata = Kata.find(params[:id])
  end

  # POST /kata
  # POST /kata.json
  def create
    @kata = Kata.new(params[:kata])

    respond_to do |format|
      if @kata.save
        format.html { redirect_to @kata, notice: 'Katum was successfully created.' }
        format.json { render json: @kata, status: :created, location: @kata }
      else
        format.html { render action: "new" }
        format.json { render json: @kata.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /kata/1
  # PUT /kata/1.json
  def update
    @kata = Kata.find(params[:id])

    respond_to do |format|
      if @kata.update_attributes(params[:kata])
        format.html { redirect_to @kata, notice: 'Katum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @kata.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kata/1
  # DELETE /kata/1.json
  def destroy
    @kata = Kata.find(params[:id])
    @kata.destroy

    respond_to do |format|
      format.html { redirect_to kata_url }
      format.json { head :no_content }
    end
  end
end
