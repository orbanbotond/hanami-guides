require 'bundler/setup'
require 'hanami/setup'
require 'hanami/model'
require_relative '../lib/app'
require_relative '../apps/web/application'
require_relative '../apps/api/application'

Hanami.configure do
  mount Api::Application, at: '/api'
  mount Web::Application, at: '/'

  model do
    ##
    # Database adapter
    #
    # Available options:
    #
    #  * SQL adapter
    #    adapter :sql, 'sqlite://db/app_development.sqlite3'
    #    adapter :sql, 'postgresql://localhost/app_development'
    #    adapter :sql, 'mysql://localhost/app_development'
    #
    adapter :sql, ENV.fetch('DATABASE_URL')

    ##
    # Migrations
    #
    migrations 'db/migrations'
    schema     'db/schema.sql'
  end

  mailer do
    root 'lib/app/mailers'

    # See http://hanamirb.org/guides/mailers/delivery
    delivery :test
  end

  environment :test do
    # See: http://hanamirb.org/guides/projects/logging
    logger level: :debug, filter: %w[password password_confirmation]
  end

  environment :development do
    # See: http://hanamirb.org/guides/projects/logging
    logger level: :debug, filter: %w[password password_confirmation]
  end

  environment :production do
    logger level: :info, formatter: :json, filter: %w[password password_confirmation]

    mailer do
      delivery :smtp, address: ENV.fetch('SMTP_HOST'), port: ENV.fetch('SMTP_PORT')
    end
  end
end
