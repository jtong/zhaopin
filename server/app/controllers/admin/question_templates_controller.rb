#encoding: utf-8
module Admin
  class QuestionTemplatesController < AdminController
    before_filter :admin_authenticate
    include HamlHelper

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

          format.html { redirect_to [:admin,@question_template], notice: 'Question template was successfully created.' }
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
      params[:files].each_pair do |field_name, file|
        unless file.original_filename.empty?
          @question_template.send "#{field_name}=", file.original_filename
        end
      end
      respond_to do |format|
        if @question_template.update_attributes(params[:question_template])
          @question_template.upload_files(params[:files].values)
          format.html { redirect_to [:admin,@question_template], notice: 'Question template was successfully updated.' }
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

    def preview
      @question_template = QuestionTemplate.find(params[:id])
      @current_steps = 1
      question_value = @question_template.render
      @my_question = MyQuestion.new
      @my_question.name = @question_template.name
      @my_question.content = question_value[:content]
      @my_question.answer = question_value[:answer]
      @my_question.answer_verify_type = question_value[:answer_verify_type]
      session[:preview_answer]  = @my_question.answer
      session[:preview_answer_verify_type]  = @my_question.answer_verify_type
    end

    def emulate_judge
      my_question = MyQuestion.new
      my_question.answer = session[:preview_answer]
      my_question.answer_verify_type = session[:preview_answer_verify_type]
      my_question.user_post = params[:user_post]
      p my_question.answer
      p my_question.answer_verify_type
      p my_question.user_post
      render :text => my_question.right?
    end
  end

end