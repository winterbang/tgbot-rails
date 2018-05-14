module Tgbot
  class Engine < ::Rails::Engine
    isolate_namespace Tgbot

    initializer 'tgbot.init' do |app|
      # https://github.com/rails/rails/blob/3-2-stable/actionpack/lib/action_dispatch/routing/route_set.rb#L268
      # `app.routes.prepend` start from Rails 3.2 - 5.0
      # app.routes.prepend do
      #   mount Tgbot::Engine => '/tgbot'
      # end

      Tgbot.check_webhook!
    end
  end
end
