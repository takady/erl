require 'spec_helper'
require 'erl/command'

describe Erl::Command do
  it "should be able to execute" do
    command = Erl::Command.new(%w(cat))
    command.send(:execute, 'Gemfile')
    pid = command.procs.keys.first
    log = command.procs[pid]
    Process.waitall
    expect(File.open(log).read).to eq('Gemfile')
  end
end
