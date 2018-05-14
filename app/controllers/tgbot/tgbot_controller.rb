module Tgbot
  class TgbotController < ::ActionController::API
    before_action :authenticate!

    def index
      case message
      when Telegram::Bot::Types::CallbackQuery
        # instance_exec(&block)
        content = try(:callback_query_type) || {chat_id: message.from.id, text: message.data}
      when Telegram::Bot::Types::Message
        content = try(:message_type) || {chat_id: message.chat.id, text: message.text}
      end
      bot.send_message(content)

      render json: {ok: true}, :status => :ok
    end

    private
    def current_user
      @telegram_user ||= ::Tgbot.user(message.from.id)
    end

    def bot
      @bot ||= ::Tgbot.api
    end

    def message
      @message ||= ::Telegram::Bot::Types::Update.new(params[:tgbot].permit!).current_message
    end

    def authenticate!
    end


  end
end
