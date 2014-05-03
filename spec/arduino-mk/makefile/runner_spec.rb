require "spec_helper"

describe Arduino::Makefile::Runner do
  let(:fixtures) { File.join(Dir.pwd, "spec", "fixtures") }

  after do
    FileUtils.rm_f("Makefile_test")
  end

  it "runs the makefile in the given directory" do
    subject.run(fixtures, "test")
    File.exists?("Makefile_test").should be_true
  end

  it "returns an object that responds to #success?" do
    output = subject.run(fixtures, "test")
    output.success?.should be_true

    output = subject.run(fixtures, "missing")
    output.success?.should be_false
  end

  it "returns an object that response to stderr" do
    output = subject.run(fixtures, "test")
    output.stderr.should be_empty

    output = subject.run(fixtures, "missing")
    output.stderr.should include "No rule to make target `missing'"
  end

end
