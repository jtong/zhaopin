class QuestionTemplate < ActiveRecord::Base
  attr_accessible :name


  def upload_files(files)
    files.each do |file|
      save_file file
    end
  end

  def save_file(file)
    prepare_template_file_dir
    File.open("#{question_template_dir}/#{file.original_filename}", "wb") do |f|
      f.write file.read
    end
  end

  def render
    # context = ExecJS.compile(javascript_content)
    # context.exec("var question = new JobGuessQuestion('p#{P1} #{P2} #{P3}', function(array){ return array; }); question.render();")
  end

  def javascript_content
    File.read("#{question_template_dir}/#{js_file}") 
  end

  def template_content
    File.read("#{question_template_dir}/#{template_file}")
  end

  private

  def prepare_template_file_dir
    create_directory_if_not_exists root_dir
    create_directory_if_not_exists question_template_dir
  end

  def question_template_dir
    "#{root_dir}/#{id}"
  end

  def root_dir
    "#{Rails.root}/public/files"
  end

  def create_directory_if_not_exists(directory_name)
    Dir.mkdir(directory_name) unless File.exists?(directory_name)
  end
end
