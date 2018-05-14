module Tgbot
  module Generators
    # rails g tgbot:controller
    class ControllerGenerator < ::Rails::Generators::Base # :nodoc:
      source_root File.expand_path(File.join(File.dirname(__FILE__), 'templates'))

      desc "Copies Tgbot controller file to your application's controller directory."
      def copy_initialize_file
        template 'tgbot_controller.rb', 'app/controllers/tgbot/tgbot_controller.rb'
      end
    end
  end
end
