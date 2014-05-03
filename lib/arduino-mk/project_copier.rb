module Arduino::ProjectCopier
  def self.copy(project_directory)
    basename = File.basename(project_directory)
    FileUtils.cp_r(project_directory, "#{basename}_copy")
  end
end
