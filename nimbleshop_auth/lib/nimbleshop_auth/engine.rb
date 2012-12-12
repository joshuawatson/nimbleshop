module NimbleshopAuth
  class Engine < ::Rails::Engine

    isolate_namespace NimbleshopAuth

    config.after_initialize do
      Rails.application.routes_reloader.reload!
    end

    initializer 'nimbleshop_auth.precompile_assets' do |config|
      Rails.application.config.assets.precompile += %w( nimbleshop_auth/auth.css )
      Rails.application.config.assets.precompile += %w( nimbleshop_auth/auth.js )
    end

  end
end
