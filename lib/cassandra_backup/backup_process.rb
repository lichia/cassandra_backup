require 'cassandra_backup/command'

module CassandraBackup
  class BackupProcess
    def self.run!
      new(CassandraBackup::Command.new(ARGV)).run
    end

    attr_reader :command
    def initialize(command)
      @command = command
    end

    def run
      raise "inheriting class must implement"
    end

    def connection
      @connection ||= Cassandra.new(command.keyspace, command.servers)
    end

    def input_io
      $stdin
    end

    def output_io
      $stdout
    end
  end
end