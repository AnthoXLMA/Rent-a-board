# -*- encoding: utf-8 -*-
# stub: IPinfo 0.1.2 ruby lib

Gem::Specification.new do |s|
  s.name = "IPinfo".freeze
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Stanislav K, James Timmins".freeze]
  s.bindir = "exe".freeze
  s.date = "2018-12-05"
  s.description = " The official Python library for IPinfo. IPinfo prides itself on being the most reliable, accurate, and in-depth source of IP address data available anywhere. We process terabytes of data to produce our custom IP geolocation, company, carrier and IP type data sets. You can visit our developer docs at https://ipinfo.io/developers. ".freeze
  s.email = ["jameshtimmins@gmail.com".freeze]
  s.homepage = "https://ipinfo.io".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0".freeze)
  s.rubygems_version = "3.2.7".freeze
  s.summary = "The official Python library for IPinfo. IPinfo prides itself on being the most reliable, accurate, and in-depth source of IP address data available anywhere. We process terabytes of data to produce our custom IP geolocation, company, carrier and IP type data sets. You can visit our developer docs at https://ipinfo.io/developers.".freeze

  s.installed_by_version = "3.2.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<faraday>.freeze, ["~> 0"])
    s.add_runtime_dependency(%q<lrucache>.freeze, ["~> 0.1.4"])
    s.add_runtime_dependency(%q<json>.freeze, ["~> 2.1"])
  else
    s.add_dependency(%q<faraday>.freeze, ["~> 0"])
    s.add_dependency(%q<lrucache>.freeze, ["~> 0.1.4"])
    s.add_dependency(%q<json>.freeze, ["~> 2.1"])
  end
end
