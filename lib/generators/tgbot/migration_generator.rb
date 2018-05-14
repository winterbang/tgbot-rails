require 'rails/generators/migration'

module Tgbot
  module Generators
    class MigrationGenerator < ::Rails::Generators::Base
      include Rails::Generators::Migration

      desc "Generates migration for tgbot"

      def self.orm
        Rails::Generators.options[:rails][:orm]
      end

      def self.source_root
        File.join(File.dirname(__FILE__), 'templates', (orm.to_s unless orm.class.eql?(String)) )
      end

      def self.orm_has_migration?
        [:active_record].include? orm
      end

      def self.next_migration_number(path)
        Time.now.utc.strftime("%Y%m%d%H%M%S")
      end

      def create_migration_file
        if self.class.orm_has_migration?
          migration_template 'tgbot_migration.rb', 'db/migrate/tgbot_migration.rb'
        end
      end

    end
  end
end
