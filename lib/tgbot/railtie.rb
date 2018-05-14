module Tgbot
  class Railtie < ::Rails::Railtie
    rake_tasks do
      load 'tasks/tgbot/tgbot_tasks.rake'
    end

    initializer 'tgbot.init' do |app|
      app.routes.prepend do
        mount Tgbot::Engine, at: '/'
      end
    end
  end
end
