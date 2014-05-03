module Arduino::Makefile
  module Runner

    def self.run(makefile, task)
      command = "make -C #{makefile} #{task}"
      command = stderr_only(command)
      stderr = `#{command}`

      Result.new(stderr)
    end

    private
    def self.stderr_only(command)
      "(#{command} 1>/dev/null) 2>&1"
    end

    class Result
      attr_reader :stderr

      def initialize(stderr)
        @success = $?.success?
        @stderr = stderr
      end

      def success?
        @success
      end
    end
  end
end
