module Tgbot
  class Configuration
    attr_accessor :token, :url, :user, :crtificate_file_path, :auth

    def initialize
      @token = ''
      @url = '/tgbot'
      @crtificate_file_path = ''
      @user = 'TelegramUser'
    end

  end
end
