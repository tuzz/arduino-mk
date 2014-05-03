require "spec_helper"

describe Arduino::ErrorImprover do

  it "adds helpful info when the port is wrong" do
    message = "[before] Arduino port foo not found! [after]"
    message = subject.improve(message)

    message.should include("Could not find an arduino on port foo")
    message.should include("Try removing the port from the init")
    message.should include("The port is usually /dev/ttySomething")
  end

  it "adds helpful info when the port could not be detected" do
    message = "[before] Arduino port  not found! [after]"
    message = subject.improve(message)

    message.should include("Could not find an arduino by autodetection")
    message.should include("Try setting the port explicitly in your initializer")
    message.should include("The port is usually /dev/ttySomething")
  end

  it "adds helpful info about boards" do
    message = ""
    message = subject.improve(message)

    message.should include("Sometimes you'll get random errors")
    message.should include("Please make sure you've set the board correctly")
    message.should include("For a list of supported boards, run")
  end
end
