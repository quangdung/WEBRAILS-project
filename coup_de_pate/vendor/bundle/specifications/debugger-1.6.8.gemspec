# -*- encoding: utf-8 -*-
# stub: debugger 1.6.8 ruby lib
# stub: ext/ruby_debug/extconf.rb

Gem::Specification.new do |s|
  s.name = "debugger"
  s.version = "1.6.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Kent Sibilev", "Mark Moseley", "Gabriel Horner"]
  s.date = "2014-05-27"
  s.description = "debugger is a fast implementation of the standard Ruby debugger debug.rb.\nIt is implemented by utilizing a new Ruby C API hook. The core component\nprovides support that front-ends can build on. It provides breakpoint\nhandling, bindings for stack frames among other things.\n"
  s.email = "gabriel.horner@gmail.com"
  s.executables = ["rdebug"]
  s.extensions = ["ext/ruby_debug/extconf.rb"]
  s.extra_rdoc_files = ["README.md"]
  s.files = ["README.md", "bin/rdebug", "ext/ruby_debug/extconf.rb"]
  s.homepage = "http://github.com/cldwalker/debugger"
  s.licenses = ["BSD"]
  s.rubygems_version = "2.4.6"
  s.summary = "Fast Ruby debugger - base + cli"

  s.installed_by_version = "2.4.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<columnize>, [">= 0.3.1"])
      s.add_runtime_dependency(%q<debugger-ruby_core_source>, ["~> 1.3.5"])
      s.add_runtime_dependency(%q<debugger-linecache>, ["~> 1.2.0"])
      s.add_development_dependency(%q<rake>, ["~> 0.9.2.2"])
      s.add_development_dependency(%q<rake-compiler>, ["~> 0.8.0"])
      s.add_development_dependency(%q<minitest>, ["~> 2.12.1"])
      s.add_development_dependency(%q<mocha>, ["~> 0.13.0"])
    else
      s.add_dependency(%q<columnize>, [">= 0.3.1"])
      s.add_dependency(%q<debugger-ruby_core_source>, ["~> 1.3.5"])
      s.add_dependency(%q<debugger-linecache>, ["~> 1.2.0"])
      s.add_dependency(%q<rake>, ["~> 0.9.2.2"])
      s.add_dependency(%q<rake-compiler>, ["~> 0.8.0"])
      s.add_dependency(%q<minitest>, ["~> 2.12.1"])
      s.add_dependency(%q<mocha>, ["~> 0.13.0"])
    end
  else
    s.add_dependency(%q<columnize>, [">= 0.3.1"])
    s.add_dependency(%q<debugger-ruby_core_source>, ["~> 1.3.5"])
    s.add_dependency(%q<debugger-linecache>, ["~> 1.2.0"])
    s.add_dependency(%q<rake>, ["~> 0.9.2.2"])
    s.add_dependency(%q<rake-compiler>, ["~> 0.8.0"])
    s.add_dependency(%q<minitest>, ["~> 2.12.1"])
    s.add_dependency(%q<mocha>, ["~> 0.13.0"])
  end
end
