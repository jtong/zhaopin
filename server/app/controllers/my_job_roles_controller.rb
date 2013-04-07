class MyJobRolesController < ApplicationController
  # GET /my_job_roles
  # GET /my_job_roles.json
  def index
    @my_job_roles = MyJobRole.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @my_job_roles }
    end
  end

  # GET /my_job_roles/1
  # GET /my_job_roles/1.json
  def show
    @my_job_role = MyJobRole.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @my_job_role }
    end
  end

  # GET /my_job_roles/new
  # GET /my_job_roles/new.json
  def new
    @my_job_role = MyJobRole.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @my_job_role }
    end
  end

  # GET /my_job_roles/1/edit
  def edit
    @my_job_role = MyJobRole.find(params[:id])
  end

  # POST /my_job_roles
  # POST /my_job_roles.json
  def create
    @my_job_role = MyJobRole.new(params[:my_job_role])

    respond_to do |format|
      if @my_job_role.save
        format.html { redirect_to @my_job_role, notice: 'My job role was successfully created.' }
        format.json { render json: @my_job_role, status: :created, location: @my_job_role }
      else
        format.html { render action: "new" }
        format.json { render json: @my_job_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /my_job_roles/1
  # PUT /my_job_roles/1.json
  def update
    @my_job_role = MyJobRole.find(params[:id])

    respond_to do |format|
      if @my_job_role.update_attributes(params[:my_job_role])
        format.html { redirect_to @my_job_role, notice: 'My job role was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @my_job_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my_job_roles/1
  # DELETE /my_job_roles/1.json
  def destroy
    @my_job_role = MyJobRole.find(params[:id])
    @my_job_role.destroy

    respond_to do |format|
      format.html { redirect_to my_job_roles_url }
      format.json { head :no_content }
    end
  end
end
