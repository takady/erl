require "readline"

module Erl
  class Command
    attr_reader :procs

    def initialize(opt)
      @command = opt.join
      @prompt = 'erl> '
      @procs = {}
    end

    def self.run(argv)
      new(argv).repl
    end

    private

    def repl
      while buf = Readline.readline(@prompt, true)
        Readline.completion_append_character = " "
        if %w(exit quit).include? buf
          puts "Bye"
          break
        end
        execute buf
      end
    rescue Interrupt
      puts "\nBye"
    rescue => e
      abort "Error: #{e.message}"
    end

    def execute(query)
      log = "/tmp/#{Time.now.strftime('%Y%m%d%H%M%S%L')}"
      pid = Process.spawn("echo #{query} | tr -d '\n' | #{@command}", [:out, :err]=>[log, "w"])
      @procs[pid] = log
    end
  end
end
