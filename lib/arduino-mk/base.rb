class Arduino

  attr_reader :error

  def initialize(options = {})
    @options = OptionParser.parse(options)
  end

  def upload(project)
    make(project, "upload")
  end

  def compiles?(project)
    make(project)
  end

  private
  def make(project, command = "all")
    copy_dir = ProjectCopier.copy(project)
    Makefile::Template.create(copy_dir, @options)
    result = Makefile::Runner.run(copy_dir, "upload")
    FileUtils.rm_rf(copy_dir)

    @error = result.stderr
    result.success?
  end

end

