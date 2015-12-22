# Andy updated this to work with latest versions of rails and sprockets.  This was originally copied after handlebars-assets, 
# but is long out of date, and I used that as a template for how to update:
# https://github.com/leshill/handlebars_assets/blob/master/lib/handlebars_assets/engine.rb

module RactiveAssets
  class Engine < ::Rails::Engine
    initializer "sprockets.ractive", :group => :all do |app|
      config.assets.configure do |sprockets_env|
        sprockets_env.register_engine '.rac',         TiltRactive
        sprockets_env.register_engine '.ractive',     TiltRactive
        sprockets_env.register_engine('.ractivehaml', TiltRactive) if RactiveAssets::Config.haml_available?
        sprockets_env.register_engine('.ractiveslim', TiltRactive) if RactiveAssets::Config.slim_available?
      end
    end
  end
end
