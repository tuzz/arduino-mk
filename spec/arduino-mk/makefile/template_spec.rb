require "spec_helper"

describe Arduino::Makefile::Template do

  after do
    FileUtils.rm_f("Makefile")
  end

  it "creates a Makefile in the given directory" do
    subject.create(".", {})
    File.exists?("Makefile").should be_true
  end

  it "sets up environment variables for the options" do
    subject.create(".", foo: "bar", baz:"qux")
    content = File.read("Makefile")

    content.should include("foo=bar")
    content.should include("baz=qux")
  end

  it "includes an absolute path to Arduino.mk" do
    subject.create(".", {})
    content = File.read("Makefile")

    relative_path = ["vendor", "Arduino-Makefile", "Arduino.mk"]
    absolute_path = File.join(Dir.pwd, relative_path)

    content.should include("include #{absolute_path}")
  end

end
