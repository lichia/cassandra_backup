module CassandraBackup
  class Command

    attr_accessor :options
    def initialize(args)
      self.options = {}

      if args.first
        options[:keyspace] = args.first
      else
        args.push '-h'
      end

      OptionParser.new do |opts|
        opts.banner = "Usage: keyspace [options]"
        opts.on('-s', '--servers SERVERS', 'Set server list. Default is 127.0.0.1:9160.') do |v|
          options[:servers] = v.split(/\s|,/)
        end
        opts.on('-v', '--version VERSION', 'Set cassandra version. Default is 1.0.') do |v|
          options[:version] = v
        end
        opts.on('-c', '--columns Columns', 'Set column families. Defaults to all') do |v|
          (options[:columns] ||= []).concat v.split(/\s|,/)
        end
        opts.on('-h', 'Show this help message.') do
          $stdout.puts opts; exit
        end
        opts.parse!(args)
      end

      require required_version
    end

    def keyspace
      options[:keyspace]
    end

    def servers
      if options[:servers]
        options[:servers]
      else
        ['127.0.0.1:9160']
      end
    end

    def columns
      if options[:columns]
        options[:columns]
      end
    end

    def required_version
      if options[:version]
        "cassandra/#{options[:version]}"
      else
        "cassandra/1.0"
      end
    end
  end
end