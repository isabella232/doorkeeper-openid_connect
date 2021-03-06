# frozen_string_literal: true

# Require `belongs_to` associations by default. This is a new Rails 5.0
# default, so it is introduced as a configuration option to ensure that apps
# made on earlier versions of Rails are not affected when upgrading.
if Rails::VERSION::MAJOR >= 5
  Rails.application.config.active_record.belongs_to_required_by_default = true

  if Rails::VERSION::MINOR >= 2
    Rails.application.config.active_record.sqlite3.represent_boolean_as_integer = true
  end
else
  # monkey-patch versioned migrations in Rails < 5.0
  class ActiveRecord::Migration
    def self.[](_version)
      self
    end
  end
end
