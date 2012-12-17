module Refinery
  module HeroImages
    module Admin
      class HeroImagesController < ::Refinery::AdminController

        crudify :'refinery/hero_images/hero_image', :xhr_paging => true

      end
    end
  end
end
