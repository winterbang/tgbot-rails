module Tgbot
  module Generators
    # rails g tgbot:config
    class ConfigGenerator < ::Rails::Generators::Base # :nodoc:
      source_root File.expand_path(File.join(File.dirname(__FILE__), 'templates'))

      desc "Copies Tgbot configuration file to your application's initializer directory."

      def copy_initialize_file
        template 'tgbot_config.rb', 'config/initializers/tgbot_config.rb'
      end
    end
  end
end
