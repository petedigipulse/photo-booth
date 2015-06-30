require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "888210eed7a9a9fe45faa4d2511d04aadd0b6e4e34eedcfc1a2be27f04b3ad79"

  url_format "/media/:job/:name"

  	if Rails.env.development? || Rails.env.test?
		datastore :file, 
			root_path: Rails.root.join('public/system/dragonfly', Rails.env), 
			server_root: Rails.root.join('public')
	else
		datastore :s3, 
				bucket_name: 'your_bucket_name', 
				access_key_id: ENV['AWS_KEY'], 
				secret_access_key: ENV['AWS_SEC'], 
				url_scheme: 'https'
	end

end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end


