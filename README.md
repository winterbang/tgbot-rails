# TgbotRails
A telegram bot for rails.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'tgbot-rails'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install tgbot-rails
```

## Getting Started

### 1.Generate `tgbot_config.rb`

```bash
$ rails g tgbot:config
```

### 2.Configure `tgbot_config.rb`

```ruby
Tgbot.configure do
  self.token = '012345678:ABCdOEK4T6jSSPRi2MES6F772QgCDL0VFb4' # telegram bot token
  self.url   = 'https://www.example.com' # 对应的回调地址是: 'https://www.example.com/tgbot/:token'
  # self.user  = 'TelegramUser' # optional, 默认用户类名为 'TelegramUser'
  # self.certificate_file_path = '/ur/certificate/file/path' # optional
end
```

### 3.Usage
#### 1.Set webhook for a given token

```bash
$ rake tgbot:set_webhook
```

#### 2.Check webhook

```bash
$ rake tgbot:info
```

#### 3.Generate `tgbot_controller.rb`

```ruby
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
```
> Tips：
 - 回调方法返回的数据格式可以参考[`Telegram API`](https://core.telegram.org/bots/api#sendmessage)
 - Telegram 要求配置的webhook必须是https协议，可以使用
 [`ngrok`](https://ngrok.com/)在本地调试开发


## Contributing

If there is any thing you'd like to contribute or fix, please:

- Fork the repo
- Add tests for any new functionality
- Make your changes
- Verify all new & existing tests pass
- Make a pull request

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
