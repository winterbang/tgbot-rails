require_relative '../../tgbot/rails/webhook'
#
# WEBHOOK
#
namespace :tgbot do
  desc "Set webhook for a given token."
  task :set_webhook => :environment do |t, args|
    Tgbot::Webhook.set
  end

  desc "get webhook info."
  task :info => :environment do |t, args|
    puts Tgbot.api.get_webhook_info
  end

end
