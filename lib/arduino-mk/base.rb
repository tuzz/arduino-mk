class Arduino

  def initialize(options = {})
    @options = OptionParser.parse(options)
  end

  def upload(project_directory)
    copy_dir = ProjectCopier.copy(project_directory)
    makefile = Makefile::Template.create(copy_dir, @options)
    output = Makefile::Runner.run(makefile, "upload")




    # copy project to local directory
    # set up a template makfile
    # run make upload and capture standard error
    # do some basic parsing of error
    # populate error variable
    # return true/false based on exit code
    # remove the copied project directory
  end

end

