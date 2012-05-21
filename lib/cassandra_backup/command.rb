module CassandraBackup
  class Command

    attr_accessor :options
    def initialize(args)
      self.options = {}

      if args.first
        options[:keyspace] = args.first
      else
        args.push '--help'
      end

      OptionParser.new do |opts|
        opts.banner = "Usage: keyspace [options]"
        opts.on('--servers', 'Set server list. Default is 127.0.0.1:9160.') { |v| options[:servers] = v.split(',') }
        opts.on('--help', 'Show this help message.') { $stdout.puts opts; exit }
        opts.parse!(ARGV)
      end
    end

    def keyspace
      options[:keyspace]
    end

    def servers
      options[:servers] || ['127.0.0.1:9160']
    end

    def input_io
      $stdin
    end

    def output_io
      $stdout
    end
  end
end