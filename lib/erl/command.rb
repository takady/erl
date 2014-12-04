require 'pty'
require 'expect'
require "readline"

module Erl
  class Command
    def initialize(opt)
      @command = opt.join
    end

    def run
      repl
    end

    private

    def repl
      PTY.spawn(@command) do |r, w, pid|
        w.sync = true
        $expect_verbose = true

        loop do
          r.expect('mysql') do
            buf = Readline.readline('> ', true)
            w.print "#{buf}\n"
            raise if %w(exit quit).include? buf
          end
        end
      end
    rescue StandardError
      puts "\nBye"
    rescue Interrupt
      puts "\nBye"
    rescue => e
      abort "Error: #{e.message}"
    end
  end
end
