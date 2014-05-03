require "spec_helper"

describe Arduino::OptionParser do

  it "raises an error if no board is set" do
    expect {
      subject.parse({})
    }.to raise_error(ArgumentError, /Arduino.boards/)
  end

  it "renames :board to :BOARD_TAG" do
    hash = subject.parse(board: "foo")
    hash.should == { BOARD_TAG: "foo" }
  end

  it "renames :port to :ARDUINO_PORT" do
    hash = subject.parse(board: "foo", port: "bar")
    hash.should == { BOARD_TAG: "foo", ARDUINO_PORT: "bar" }
  end

  it "capitalizes other options" do
    hash = subject.parse(board: "foo", other: "bar")
    hash.should == { BOARD_TAG: "foo", OTHER: "bar" }
  end

  it "does not mutate its input" do
    input = { board: "foo", port: "bar", other: "baz" }.freeze

    expect {
      subject.parse(input)
    }.to_not raise_error
  end

end
