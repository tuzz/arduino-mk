module Arduino::Makefile
  module Runner

    def self.run(makefile, task)
      command = "make -C #{makefile} #{task}"
      Result.new(*Open3.capture3(command))
    end

    class Result
      attr_reader :stdout, :stderr

      def initialize(stdout, stderr, status)
        @stdout = stdout
        @stderr = stderr
        @success = status.success?
      end

      def success?
        @success
      end
    end
  end
end
