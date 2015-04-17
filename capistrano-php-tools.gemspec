# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/php_tools/version'

Gem::Specification.new do |gem|
  gem.name          = "capistrano-php-tools"
  gem.version       = Capistrano::PHPTools::VERSION
  gem.authors       = ["Bryce Kalow", "Chad Fennell"]
  gem.email         = ["hello@brycekalow.name", "fenne035@umn.edu"]
  gem.description   = <<-EOF.gsub(/^\s+/, '')
  Provides various utility tasks for PHP based sites that use capistrano for deployment.

  Currently provides a method to clear the APC to avoid encountering memory allocation errors.
  EOF
  gem.summary       = "Provides various utility tasks for PHP based sites that use capistrano for deployment."
  gem.homepage      = "https://github.com/UMNLibraries/capistrano-php-tools"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "capistrano", "~> 3.1"
  gem.add_dependency "rest-client", "~> 1.8"
  gem.add_development_dependency "rake", "~> 0"
end
