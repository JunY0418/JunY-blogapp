# -*- encoding: utf-8 -*-
# stub: sprockets-rails 2.3.3 ruby lib

Gem::Specification.new do |s|
  s.name = "sprockets-rails".freeze
  s.version = "2.3.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Joshua Peek".freeze]
  s.date = "2015-09-08"
  s.email = "josh@joshpeek.com".freeze
  s.homepage = "https://github.com/rails/sprockets-rails".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.4.12".freeze
  s.summary = "Sprockets Rails integration".freeze

  s.installed_by_version = "3.4.12" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<sprockets>.freeze, [">= 2.8", "< 4.0"])
  s.add_runtime_dependency(%q<actionpack>.freeze, [">= 3.0"])
  s.add_runtime_dependency(%q<activesupport>.freeze, [">= 3.0"])
  s.add_development_dependency(%q<railties>.freeze, [">= 3.0"])
  s.add_development_dependency(%q<rake>.freeze, [">= 0"])
  s.add_development_dependency(%q<sass>.freeze, [">= 0"])
  s.add_development_dependency(%q<uglifier>.freeze, [">= 0"])
end
