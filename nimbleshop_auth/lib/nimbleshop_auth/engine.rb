module NimbleshopAuth
  class Engine < ::Rails::Engine

    isolate_namespace NimbleshopAuth

    initializer 'nimbleshop_simply.precompile_assets' do |config|
      Rails.application.config.assets.precompile += %w( nimbleshop_auth/auth.css )
      Rails.application.config.assets.precompile += %w( nimbleshop_auth/auth.js )
    end

  end
end
