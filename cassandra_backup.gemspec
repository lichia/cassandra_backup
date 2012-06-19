# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = 'cassandra_backup'
  s.version = '0.0.4'
  s.description = 'Cassandra Backup'
  s.summary = 'Cassandra Backup'
  s.authors = ['Infogroup']
  s.email = 'gems@gotime.com'
  s.homepage = 'http://github.com/data-axle/cassandra_backup'

  s.required_ruby_version     = '>= 1.8.7'
  s.required_rubygems_version = '>= 1.3.6'  
  s.executables   = ['cassandra_dump', 'cassandra_import']
  s.extra_rdoc_files = ['README.rdoc']
  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {test}/*`.split("\n")

  s.add_runtime_dependency('mcmire-cassandra', ">= 0.12.3")
  s.add_runtime_dependency('yajl-ruby')
  s.add_development_dependency('bundler')
end
