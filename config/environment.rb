# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Store files locally.
# config.active_storage.service = :local
Rails.application.config.active_storage.service = :local