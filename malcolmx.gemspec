# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "malcolmx/version"

Gem::Specification.new do |s|
  s.name        = "malcolmx"
  s.version     = Malcolmx::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Khaja Minhajuddin"]
  s.email       = ["minhajuddin@cosmicvent.com"]
  s.homepage    = "http://github.com/minhajuddin/malcolmx"
  s.summary     = %q{Find out if the domain name you want is available!}
  s.description = %q{MalcolmX is a gem which allows you to find out if a domain name is available programmatically or through the command prompt}

  s.rubyforge_project = "malcolmx"

  s.add_dependency('httparty')
  s.add_dependency('crack')

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
