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
Rails.application.config.assets.precompile += %w( common.css common.js )
Rails.application.config.assets.precompile += %w( flyer.css )
Rails.application.config.assets.precompile += %w( static.css static.js )
Rails.application.config.assets.precompile += %w( select_user.css )
Rails.application.config.assets.precompile += %w( posts/review.css )

Rails.application.config.assets.precompile += %w( owners/show.css )
Rails.application.config.assets.precompile += %w( owners.css owners.js )
Rails.application.config.assets.precompile += %w( owners/registrations/new.css owners/registrations/new.js )
Rails.application.config.assets.precompile += %w( owners/sessions/new.css )
Rails.application.config.assets.precompile += %w( owner/resident.css )
Rails.application.config.assets.precompile += %w( owner/houses/index.css )
Rails.application.config.assets.precompile += %w( owner/houses/form.css )
Rails.application.config.assets.precompile += %w( owner/houses/show.css owner/houses/show.js )
Rails.application.config.assets.precompile += %w( owner/requests/index.css )
Rails.application.config.assets.precompile += %w( owner/residents/index.css )
Rails.application.config.assets.precompile += %w( owner/phone_lists/index.css owner/phone_lists/index.js )
Rails.application.config.assets.precompile += %w( owner/contacts/edit.css owner/contacts/edit.js )
Rails.application.config.assets.precompile += %w( owner/contacts/index.css )
Rails.application.config.assets.precompile += %w( owner/posts/form.css owner/posts/form.js )
Rails.application.config.assets.precompile += %w( owner/posts/index.css owner/posts/index.js)
Rails.application.config.assets.precompile += %w( owner/posts/show.css )
Rails.application.config.assets.precompile += %w( owner/posts/new.css owner/posts/new.js )
Rails.application.config.assets.precompile += %w( owner/invoices/index.css owner/invoices/index.js )
Rails.application.config.assets.precompile += %w( owner/invoices/show.css )

Rails.application.config.assets.precompile += %w( residents.css residents.js )
Rails.application.config.assets.precompile += %w( residents/show.css )
Rails.application.config.assets.precompile += %w( residents/edit.css )
Rails.application.config.assets.precompile += %w( residents/sessions/new.css )
Rails.application.config.assets.precompile += %w( residents/registrations/new.css )
Rails.application.config.assets.precompile += %w( resident.css resident.js )
Rails.application.config.assets.precompile += %w( resident/houses/new.js resident/houses/new.css )
Rails.application.config.assets.precompile += %w( resident/posts/show.css resident/posts/show.js )
Rails.application.config.assets.precompile += %w( resident/posts/index.css )

