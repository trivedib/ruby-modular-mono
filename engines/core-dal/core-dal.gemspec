# frozen_string_literal: true

require_relative 'lib/core/dal/version'

Gem::Specification.new do |spec|
  spec.name        = 'core-dal'
  spec.version     = Core::Dal::VERSION
  spec.authors     = ['Trivedi Bodlapati']
  spec.email       = ['trivedi.bodlapati@amount.com']
  spec.homepage    = 'https://core-dal.com'
  spec.summary     = 'Summary of Core::Dal.'
  spec.description = 'Description of Core::Dal.'
  spec.license     = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  spec.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  spec.add_dependency 'rails', '~> 6.1.4', '>= 6.1.4.1'

  spec.add_development_dependency 'factory_bot_rails'
  spec.add_development_dependency 'rspec-rails'
end
