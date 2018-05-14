module Tgbot
  class User
    include ActiveModel::Model

    attr_accessor :first_name, :last_name, :username, :telegram_id
    validates_presence_of :telegram_id
  end
end
