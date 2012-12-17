module Refinery
  module HeroImages
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::HeroImages

      engine_name :refinery_hero_images

      initializer "register refinerycms_hero_images plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "hero_images"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.hero_images_admin_hero_images_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/hero_images/hero_image'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::HeroImages)
      end
    end
  end
end
