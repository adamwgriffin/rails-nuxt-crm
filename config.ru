# This file is used by Rack-based servers to start the application.

require_relative "config/environment"

# Set the default port to 4000
ENV['PORT'] ||= '4000'

run Rails.application
Rails.application.load_server
