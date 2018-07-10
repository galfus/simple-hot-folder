# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simple_hot_folder/version'

Gem::Specification.new do |s|

  s.name = "Simple Hot Folder"
  s.version = SimpleHotFolder::VERSION
  s.authors = ["Manu"]
  s.email = ["galfus@gmail.com"]
  s.date = Time.now.strftime('%Y-%m-%d')
  s.summary = %q{Write a short summary, because Rubygems requires one.}
  s.description = %q{Write a longer description or delete this line.}
  s.license = "Nonstandard"
  s.homepage = "http://www.galfus.com"

  # s.required_ruby_version = '>= 2.1.0'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  # end

  # Jekyll
  # s.files         = all_files.grep(%r!^(exe|lib)/|^.rubocop.yml$!)
  # s.executables   = all_files.grep(%r!^exe/!) { |f| File.basename(f)  }
  
  # Colorize
  # s.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  # s.executables   = s.files.grep(%r{^exe/}) { |f| File.basename(f) }

  # Custom
  all_files = `git ls-files -z`.split("\x0")
  s.files = all_files
    .reject { |f| f.match(%r{^(test|spec|features|doc|tmp|pkg)/}) }
  s.executables = all_files.grep(%r{^exe/}) { |f| File.basename(f) }

  # spec.test_files = [
  #   'test/bla-bla.rb'
  # ]

  s.bindir        = "exe"
  s.require_paths = ["lib"]

  # s.add_runtime_dependency("addressable", "~> 2.4")
  # s.add_runtime_dependency("dry-struct")

  s.add_development_dependency "bundler", "~> 1.12"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency 'minitest', '~> 5.0'

  # puts ''
  # puts '------------ Configurando gem'
  # puts ''
  # puts 'All:'
  # p all_files
  # puts ''
  # puts 'Files:'
  # p s.files
  # puts ''
  # puts 'Execuables:'
  # p s.executables
  # puts '------------'
  # puts ''
end
