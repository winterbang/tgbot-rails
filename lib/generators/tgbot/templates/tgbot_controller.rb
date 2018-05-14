module Tgbot
  class TgbotController < ::ActionController::API

    def callback_query_type
      # do something when get callback query message
      # 可以使用`message`方法，是对当前telegram发起的回调所传参数的封装
      # return {
      #   chat_id: xxxx,
      #   text: 'xxxxxx'
      # }
    end

    def message_type
      # do something when get message
      # 可以使用`message`方法，是对当前telegram发起的回调所传参数的封装
      # return {
      #   chat_id: xxxx,
      #   text: 'xxxxxx'
      # }
    end
  end
end
