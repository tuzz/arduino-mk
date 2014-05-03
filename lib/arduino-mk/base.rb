class Arduino

  def initialize(options = {})
    @options = OptionParser.parse(options)
  end

  def upload(project)
    make(project, "upload")
    @result.success?
  end

  def compiles?(project)
    make(project)
    @result.success?
  end

  def reset
    make(NullProject.path, "reset")
    @result.success?
  end

  def output
    return unless @result
    @result.stdout
  end

  def error
    return unless @result

    if @result.success?
      @result.stderr
    else
      ErrorImprover.improve(@result.stderr)
    end
  end

  def self.boards
    instance = new(board: "null")
    instance.boards
  end

  def boards
    make(NullProject.path, "show_boards")
    array = output.split("\n")
    array[array.index("uno")..-2]
  end

  def self.makefile
    Makefile::Template.path_to_arduino_mk
  end

  private
  def make(project, command = "all")
    copy_dir = ProjectCopier.copy(project)
    Makefile::Template.create(copy_dir, @options)
    @result = Makefile::Runner.run(copy_dir, command)
    FileUtils.rm_rf(copy_dir)
  end

end

