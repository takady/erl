require 'pty'
require 'expect'
require 'readline'

module Erl
  class Command
    def initialize(command, history: nil)
      @command = command
      @history = history || File.expand_path("~/.erl_history")

      if FileTest.exist? @history
        File.open(@history).read.split("\n").each do |sql|
          Readline::HISTORY.push(sql)
        end
      else
        File.open(@history,'w').close
      end
    end

    def run
      repl
    end

    private

    def repl
      r, w, pid = PTY.spawn(@command)
      w.sync = true

      loop do
        r.expect('mysql> ') do |line|
          out = line.first.split("\n")
          out.each_with_index do |o, index|
            puts o unless index == out.length - 1
          end

          buf = Readline.readline(out.last, true)
          until buf =~ /;/ do
            buf += ' ' + Readline.readline('-> ', true)
          end

          w.print "#{buf}\n"
          File.open(@history, "a") {|file| file.puts buf }
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
