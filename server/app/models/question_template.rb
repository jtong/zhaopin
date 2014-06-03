#encoding : UTF-8
class QuestionTemplate < ActiveRecord::Base
  attr_accessible :name
  has_many :question_of_exam_papers;
  has_many :exam_paper, :through => :question_of_exam_papers

  def self.find_page_template_by_name(name)
    where('name = ?', name).first.view_content
  end

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
    js = [lib_content, javascript_content].join("\n")
    source = <<-src
       var window = {};
       #{js}
       var jade = window.jade;
    src
    #puts source
    context = ExecJS.compile(source)
    #puts "new_question(#{template_content.to_json}).build()".force_encoding "UTF-8"
    context.eval("new_question(#{template_content.to_json}).build()" ).symbolize_keys!;
  end

  def javascript_content
    File.read("#{question_template_dir}/#{js_file}") 
  end

  def template_content
    File.read("#{question_template_dir}/#{template_file}")
  end

  def view_content
    File.read("#{question_template_dir}/#{view_file}") 
  end

  def lib_content
     [ File.read("#{question_lib_dir}/jade.min.js"),
       File.read("#{question_lib_dir}/underscore-min.js"),
       File.read("#{question_lib_dir}/base.js")
     ].join("\n")
  end

  private

  def prepare_template_file_dir
    create_directory_if_not_exists root_dir
    create_directory_if_not_exists question_template_dir
  end

  def question_template_dir
    "#{root_dir}/files/#{id}"
  end

  def question_lib_dir
    "#{root_dir}/lib/"
  end

  def root_dir
    "#{Rails.root}/public/"
  end

  def create_directory_if_not_exists(directory_name)
    Dir.mkdir(directory_name) unless File.exists?(directory_name)
  end
end
