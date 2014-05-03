module Arduino::ErrorImprover
  def improve(message)
    case message
    when /Arduino port (.*) not found!/
      message + boilerplate(ports($1))
    else
      message + boilerplate(boards)
    end
  end

  private
  def ports(attempt)
    hint = "The port is usually /dev/ttySomething"
    if attempt.empty?
      [
        "Could not find an arduino by autodetection",
        "Try setting the port explicitly in your initializer",
        hint,
      ]
    else
      [
        "Could not find an arduino on port #{attempt}",
        "Try removing the port from the initializer to enable autodetection",
        hint,
      ]
    end
  end

  def boards
    [
      "Sometimes you'll get random errors if the wrong board is set",
      "Please make sure you've set the board correctly",
      "For a list of supported boards, run Arduino.boards",
    ]
  end

  def boilerplate(messages)
    ["\n\n=== Error ===", *messages].join("\n")
  end

  extend self
end
