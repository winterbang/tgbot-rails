require "rails/railtie" if defined?(Rails)
require 'telegram/bot'
require 'tgbot/configuration'
require 'tgbot/railtie'
require 'tgbot/engine'

module Tgbot
  module Rails
    # Your code goes here...
  end

  class << self
    def config
      return @config if defined?(@config)
      @config = Configuration.new
      @config
    end

    def configure(&block)
      config.instance_exec(&block)
    end

    def api
      @api ||= ::Telegram::Bot::Api.new(config.token)
    end

    def user telegram_id
      # ActiveRecord::Base.connection.table_exists? 'kittens'
      return config.user.constantize.send("find_by", telegram_id: telegram_id) if config.user.constantize.table_exists?
      ::Tgbot::User.new(telegram_id: telegram_id)
    end

    def check_webhook!
    end
  end

end
