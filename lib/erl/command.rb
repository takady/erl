require "readline"

module Erl
  class Command

    def initialize(opt)
      @prompt = 'erl> '
    end

    def self.run(argv)
      new(argv).repl
    end

    def repl
      while buf = Readline.readline(@prompt, true)
        if %w(exit quit).include? buf
          puts "Bye"
          break
        else
          puts "#{buf}"
        end
      end
    rescue Interrupt
      puts "\nBye"
    rescue => e
      abort "Error: #{e.message}"
    end

  end
end
