require 'telegram/bot'
require 'colorize'

module Tgbot
  module Webhook

    # @@token = '466648432:AAGuOLK4T6jSSPRi2MES6F772QgCDL0VFb4'
    # # @@url = "https://apa.mw006.org/tgbot/#{@@token}"
    # @@url = "https://1ca948ee.ngrok.io/tgbot/#{@@token}"

    def self.set
      webhook(Tgbot.config.token)
    end

    # https://api.telegram.org/bot466648432:AAGuOLK4T6jSSPRi2MES6F772QgCDL0VFb4/setWebhook?url=https://apa.mw006.org/tgbot/466648432:AAGuOLK4T6jSSPRi2MES6F772QgCDL0VFb4
    # https://api.telegram.org/bot466648432:AAGuOLK4T6jSSPRi2MES6F772QgCDL0VFb4/getWebhookInfo

    private
    def self.webhook(token, certificate_file=nil)
      action = :set
      # fail "action #{action} not allowed" unless [:set, :reset].include? action
      url = "#{Tgbot.config.url}/tgbot/#{Tgbot.config.token}"
      # puts "\n#{(action == :set)? '' : 're'}setting webhook: #{url}"

      # create bot from given token
      client = Telegram::Bot::Client.new(token)

      # what action: :set or :unset ?
      url_webhook = (action == :set)? url : ''

      # telegram server feedbacks exception handler
      begin
      #
      # WARNING
      # Note that setWebhook action by the bot instance (settings.bot) that OWN the token (#singleBotManagement)
      # This means that to manage multiple bots, this app would manage and array of bot (#multipleBotManagement)
      #
      if certificate_file.nil?
        puts "no certificate file?".yellow
        certificate = nil
      else
        puts "certificate file: #{certificate_file}".yellow
        certificate = File.open(File.expand_path(certificate_file))
      end
      resp = client.api.set_webhook(url: url_webhook, certificate: certificate)

      rescue Exception => e
        # error
        $stderr.puts "ERROR. Telegram Server refuse request for token: #{token}".red
        $stderr.puts "reason: #{e.message}".red #e.backtrace.inspect
        exit
      else
        # success
        puts "ok: #{resp['ok']}, result: #{resp['result']}, description: #{resp['description']}".yellow
        set_message = "URL: #{url_webhook}".green
        unset_message = "get updates with a long polling connection, now.".green
        puts "#{(action == :reset) ? unset_message : set_message}"
      end

    end
  end
end
