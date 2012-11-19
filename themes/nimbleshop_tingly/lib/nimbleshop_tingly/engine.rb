module NimbleshopTingly
  class Engine < ::Rails::Engine

    isolate_namespace NimbleshopTingly

    initializer 'nimbleshop_tingly.precompile_assets' do |config|
      Rails.application.config.assets.precompile += %w( nimbleshop_tingly/tingly.css )
      Rails.application.config.assets.precompile += %w( nimbleshop_tingly/tingly.js )
    end

  end
end
