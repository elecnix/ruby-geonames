Gem::Specification.new do |s|
  s.name = "ruby-geonames"
  s.version = "0.2.7"
  s.author = "Adam Wisniewski"
  s.email = "adamw@tbcn.ca"
  s.date = "2009-07-07"
  s.homepage = "http://github.com/elecnix/ruby-geonames"
  s.platform = Gem::Platform::RUBY
  s.summary = "Ruby library for Geonames Web Services (http://www.geonames.org/export/)"
  s.files = ["README.markdown", "lib/timezone.rb", "lib/wikipedia_article.rb", "lib/geonames.rb", "lib/postal_code_search_criteria.rb", "lib/intersection.rb", "lib/country_subdivision.rb", "lib/toponym.rb", "lib/toponym_search_result.rb", "lib/bounding_box.rb", "lib/web_service.rb", "lib/postal_code.rb", "lib/toponym_search_criteria.rb", "lib/tc_country_info.rb", "lib/main.rb", "lib/Rakefile.rb", "lib/address.rb", "lib/country_info.rb"]
  s.require_path = "lib"
  s.has_rdoc = true
  s.extra_rdoc_files = ["README.markdown"]
  s.required_rubygems_version = ">= 1.3.6"
  s.add_development_dependency "bundler", "~> 1.0.0"
  s.add_development_dependency "fakeweb", "~> 1.3.0"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec", "~> 2.0.0.beta.22"
end
