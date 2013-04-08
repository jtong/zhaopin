class ExamPapersController < ApplicationController
  before_filter :admin_authenticate

  # GET /exam_papers
  # GET /exam_papers.json
  def index
    @exam_papers = ExamPaper.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @exam_papers }
    end
  end

  # GET /exam_papers/1
  # GET /exam_papers/1.json
  def show
    @exam_paper = ExamPaper.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @exam_paper }
    end
  end

  # GET /exam_papers/new
  # GET /exam_papers/new.json
  def new
    @exam_paper = ExamPaper.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @exam_paper }
    end
  end

  # GET /exam_papers/1/edit
  def edit
    @exam_paper = ExamPaper.find(params[:id])
  end

  # POST /exam_papers
  # POST /exam_papers.json
  def create
    @exam_paper = ExamPaper.new(params[:exam_paper])
    @question_templates = QuestionTemplate.find(params[:questions].split(","))
    @exam_paper.question_templates = @question_templates
    respond_to do |format|
      if @exam_paper.save
        format.html { redirect_to @exam_paper, notice: 'Exam paper was successfully created.' }
        format.json { render json: @exam_paper, status: :created, location: @exam_paper }
      else
        format.html { render action: "new" }
        format.json { render json: @exam_paper.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /exam_papers/1
  # PUT /exam_papers/1.json
  def update
    @exam_paper = ExamPaper.find(params[:id])
    if(!params[:questions].blank?)
      @question_templates = QuestionTemplate.find(params[:questions].split(","))
      @exam_paper.question_templates = @question_templates
    end
    respond_to do |format|
      if @exam_paper.update_attributes(params[:exam_paper])
        format.html { redirect_to @exam_paper, notice: 'Exam paper was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @exam_paper.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exam_papers/1
  # DELETE /exam_papers/1.json
  def destroy
    @exam_paper = ExamPaper.find(params[:id])
    @exam_paper.destroy

    respond_to do |format|
      format.html { redirect_to exam_papers_url }
      format.json { head :no_content }
    end
  end
end
