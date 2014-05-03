module Arduino::OptionParser
  def parse(options)
    options = options.dup

    raise_if_no_board(options)

    rename_key(options, :board, :BOARD_TAG)
    rename_key(options, :port, :ARDUINO_PORT)

    upcase_keys(options)

    options
  end

  def raise_if_no_board(options)
    unless options[:board]
      message = "Please specifiy your board in the initializer."
      message += "\n\nArduino.boards will give you a list of valid boards."

      raise ArgumentError, message
    end
  end

  def upcase_keys(options)
    options.keys.each do |k|
      rename_key(options, k, k.upcase)
    end
  end

  def rename_key(options, from, to)
    options[to] = options.delete(from) if options[from]
  end

  extend self
end
