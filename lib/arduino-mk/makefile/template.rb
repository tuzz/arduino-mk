module Arduino::Makefile
  module Template

    def create(directory, options)
      filename = File.join(directory, "Makefile")

      File.open(filename, "w") do |file|
        file.puts environment_variables(options)
        file.puts "include #{path_to_arduino_mk}"
      end
    end

    def environment_variables(options)
      options.map { |k, v| "#{k}=#{v}" }.join("\n")
    end

    def path_to_arduino_mk
      gem_root = File.join(__FILE__, "..", "..", "..", "..")
      arduino_mk = File.join(gem_root, "vendor", "Arduino-Makefile")
      relative_path = File.join(arduino_mk, "Arduino.mk")

      File.expand_path(relative_path)
    end

    extend self
  end
end
