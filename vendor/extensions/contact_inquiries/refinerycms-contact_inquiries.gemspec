# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-contact_inquiries'
  s.version           = '1.0'
  s.description       = 'Ruby on Rails Contact Inquiries forms-extension for Refinery CMS'
  s.date              = '2013-01-07'
  s.summary           = 'Contact Inquiries forms-extension for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]

  # Runtime dependencies
  s.add_dependency             'refinerycms-core',     '~> 2.0.8'
  s.add_dependency             'refinerycms-settings', '~> 2.0.0'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing',  '~> 2.0.8'
end
