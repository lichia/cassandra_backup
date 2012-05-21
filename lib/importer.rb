class Importer
  def import!
    parser.parse(io) do |column_family, key, attributes|
      p "column_family = #{column_family}"
      p "key = #{key}"
      p "attributes = #{attributes}"
    end
  end
  
  def parser
    @parser ||= Yajl::Parser.new
  end

  def io
    $stdin
  end
end