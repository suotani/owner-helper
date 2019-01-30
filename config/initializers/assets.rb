# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
Rails.application.config.assets.precompile += %w( owners/show.css )
Rails.application.config.assets.precompile += %w( owners.css owners.js )
Rails.application.config.assets.precompile += %w( owners/registrations/new.css )
Rails.application.config.assets.precompile += %w( owners/sessions/new.css )
Rails.application.config.assets.precompile += %w( owner/houses/index.css )
Rails.application.config.assets.precompile += %w( owner/houses/form.css )
Rails.application.config.assets.precompile += %w( owner/houses/show.css owner/houses/show.js )
Rails.application.config.assets.precompile += %w( owner/requests/index.css )
Rails.application.config.assets.precompile += %w( owner/residents/index.css )
Rails.application.config.assets.precompile += %w( owner/contacts/edit.css owner/contacts/edit.js )
Rails.application.config.assets.precompile += %w( owner/contacts/index.css )
Rails.application.config.assets.precompile += %w( owner/posts/form.css owner/posts/form.js )

Rails.application.config.assets.precompile += %w( residents/sessions/new.css )
Rails.application.config.assets.precompile += %w( residents/registrations/new.css )
Rails.application.config.assets.precompile += %w( resident.css resident.js )
Rails.application.config.assets.precompile += %w( resident/houses/new.js )

Rails.application.config.assets.precompile += %w( posts/review.css )
