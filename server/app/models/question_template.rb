class QuestionTemplate < ActiveRecord::Base
  attr_accessible :name


  def upload_files(files)
    files.each do |file|
      save_file file
    end
  end

  def save_file(file)
    File.open(dest_file(file.original_filename), "w") do |f|
      f.write file.read
    end
  end

  def render
    
  end

  private

  def dest_file(uploaded_file_name)
    create_directory_if_not_exists root_dir
    create_directory_if_not_exists question_templat_dir
    "#{question_templat_dir}/#{uploaded_file_name}"
  end

  def question_templat_dir
    "#{root_dir}/#{id}"
  end

  def root_dir
    "#{Rails.root}/public/files"
  end

  def create_directory_if_not_exists(directory_name)
    Dir.mkdir(directory_name) unless File.exists?(directory_name)
  end
end
