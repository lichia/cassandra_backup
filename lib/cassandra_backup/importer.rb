require 'cassandra_backup/backup_process'

module CassandraBackup
  class Importer < BackupProcess
    def run
      parser.parse(input_io) do |column_family, key, attributes|
        p "inserting"
        connection.insert column_family, key, attributes
      end
    end

    private
      def parser
        @parser ||= Yajl::Parser.new
      end
  end
end