class Dumper
  def initialize
    
  end
  def dump!
    column_family_names.each do |column_family|
      next if column_family == 'schema_migrations'
      cassandra.each(column_family) do |key, attributes|
        io.puts encoder.encode([column_family, key, attributes])
      end
    end
  end

  def cassandra
    @cassandra ||= Cassandra.new('place_directory_development', ['127.0.0.1:9160'])
  end

  def column_family_names
    cassandra.column_families.keys
  end

  def encoder
    @encoder ||= Yajl::Encoder.new
  end

  def io
    # @io ||= File.open('foo.json', 'w') #w:utf-8
    # $stdout
  end
end