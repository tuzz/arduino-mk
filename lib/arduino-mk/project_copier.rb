module Arduino::ProjectCopier
  def self.copy(project_directory)
    basename = File.basename(project_directory)
    copy_directory = "#{basename}_copy"

    FileUtils.cp_r(project_directory, copy_directory)
    File.expand_path(copy_directory)
  end
end
