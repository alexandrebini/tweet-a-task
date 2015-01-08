require File.expand_path('../boot', __FILE__)
require 'rails/all'
Bundler.require(*Rails.groups)

module TweetATask
  class Application < Rails::Application
    config.autoload_paths << Rails.root.join('jobs')
    config.autoload_paths << Rails.root.join('lib')
    require Rails.root.join('lib/managers')

    config.active_record.raise_in_transactional_callbacks = true
  end
end