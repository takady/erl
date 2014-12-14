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
      r, w, pid = PTY.spawn(@command)
      w.sync = true

      loop do
        r.expect('mysql>') do |line|
          out = line.first.split("\n")
          out.each_with_index do |o, index|
            puts o unless index == out.length - 1
          end

          buf = Readline.readline('mysql> ', true)
          until buf =~ /;/ do
            buf += Readline.readline('> ', true)
          end

          w.print "#{buf}\n"
          raise Interrupt.new if %w(exit; quit;).include? buf
        end
      end
    rescue Interrupt
      puts "\nBye"
    rescue => e
      abort "Error: #{e.message}"
    end
  end
end
