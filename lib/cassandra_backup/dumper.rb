require 'cassandra_backup/backup_process'

module CassandraBackup
  class Dumper < BackupProcess
    def run
      column_family_names.each do |column_family|
        connection.each(column_family) do |key, attributes|
          output_io.puts encoder.encode([column_family, key, attributes])
        end
      end
    end

    private
      def column_family_names
        if command.columns
          command.columns
        else
          connection.column_families.keys - ['schema_migrations']
        end
      end

      def encoder
        @encoder ||= Yajl::Encoder.new
      end
  end
end