SPEC = Gem::Specification.new do |s| 
  s.name = "ruby-geonames" 
  s.version = "0.2.2" 
  s.author = "Adam Wisniewski" 
  s.email = "adamw@tbcn.ca" 
  s.date = "2009-05-07"
  s.homepage = "http://www.tbcn.ca/ruby_geonames" 
  s.platform = Gem::Platform::RUBY 
  s.summary = "Ruby library for Geonames Web Services (http://www.geonames.org/export/)" 
  candidates = Dir.glob("{bin,docs,lib,test}/**/*") 
  s.files = ["README.markdown", Dir.glob('lib/*.rb')].flatten
  s.require_path = "lib" 
  s.has_rdoc = true 
  s.extra_rdoc_files = ["README.markdown"]
end 
