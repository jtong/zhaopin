class QuestionTemplatesController < ApplicationController
  # GET /question_templates
  # GET /question_templates.json
  def index
    @question_templates = QuestionTemplate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @question_templates }
    end
  end

  # GET /question_templates/1
  # GET /question_templates/1.json
  def show
    @question_template = QuestionTemplate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @question_template }
    end
  end

  # GET /question_templates/new
  # GET /question_templates/new.json
  def new
    @question_template = QuestionTemplate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @question_template }
    end
  end

  # GET /question_templates/1/edit
  def edit
    @question_template = QuestionTemplate.find(params[:id])
  end

  # POST /question_templates
  # POST /question_templates.json
  def create
    @question_template = QuestionTemplate.new(params[:question_template])
    params[:files].each_pair do |field_name, file|
      unless file.original_filename.empty?
        @question_template.send "#{field_name}=", file.original_filename
      end
    end
    
    respond_to do |format|
      if @question_template.save
        @question_template.upload_files(params[:files].values)

        format.html { redirect_to @question_template, notice: 'Question template was successfully created.' }
        format.json { render json: @question_template, status: :created, location: @question_template }
      else
        format.html { render action: "new" }
        format.json { render json: @question_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /question_templates/1
  # PUT /question_templates/1.json
  def update
    @question_template = QuestionTemplate.find(params[:id])

    respond_to do |format|
      if @question_template.update_attributes(params[:question_template])
        format.html { redirect_to @question_template, notice: 'Question template was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @question_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /question_templates/1
  # DELETE /question_templates/1.json
  def destroy
    @question_template = QuestionTemplate.find(params[:id])
    @question_template.destroy

    respond_to do |format|
      format.html { redirect_to question_templates_url }
      format.json { head :no_content }
    end
  end
end
