require "spec_helper"

describe Arduino::ProjectCopier do

  after do
    FileUtils.rm_rf("project_copy")
  end

  it "copies the directory to *_copy" do
    subject.copy("spec/fixtures/project")
    File.directory?("project_copy").should be_true
  end

  it "raises an error if the directory doesn't exist" do
    expect {
      subject.copy("spec/fixtures/missing")
    }.to raise_error(/No such file or directory/)
  end

end
