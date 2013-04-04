class KataController < ApplicationController
  # GET /kata
  # GET /kata.json
  def index
    @kata = Katum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @kata }
    end
  end

  # GET /kata/1
  # GET /kata/1.json
  def show
    @katum = Katum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @katum }
    end
  end

  # GET /kata/new
  # GET /kata/new.json
  def new
    @katum = Katum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @katum }
    end
  end

  # GET /kata/1/edit
  def edit
    @katum = Katum.find(params[:id])
  end

  # POST /kata
  # POST /kata.json
  def create
    @katum = Katum.new(params[:katum])

    respond_to do |format|
      if @katum.save
        format.html { redirect_to @katum, notice: 'Katum was successfully created.' }
        format.json { render json: @katum, status: :created, location: @katum }
      else
        format.html { render action: "new" }
        format.json { render json: @katum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /kata/1
  # PUT /kata/1.json
  def update
    @katum = Katum.find(params[:id])

    respond_to do |format|
      if @katum.update_attributes(params[:katum])
        format.html { redirect_to @katum, notice: 'Katum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @katum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kata/1
  # DELETE /kata/1.json
  def destroy
    @katum = Katum.find(params[:id])
    @katum.destroy

    respond_to do |format|
      format.html { redirect_to kata_url }
      format.json { head :no_content }
    end
  end
end
