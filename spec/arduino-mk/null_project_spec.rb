require "spec_helper"

describe Arduino::NullProject do

  it "returns a path to the null_project (empty directory)" do
    path = File.join(Dir.pwd, "lib", "arduino-mk", "null_project")
    subject.path.should == path
  end

end
