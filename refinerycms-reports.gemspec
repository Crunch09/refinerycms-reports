# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-reports'
  s.author            = 'Florian Thomas'
  s.version           = '1.0'
  s.description       = 'Ruby on Rails Reports extension for Refinery CMS'
  s.date              = '2012-11-30'
  s.summary           = 'Reports extension for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib,vendor}/**/*"] + ["README.md"]

  # Runtime dependencies
  s.add_dependency             'refinerycms-core',    '~> 2.0.8'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 2.0.8'
end
