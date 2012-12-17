Refinery::PagesController.class_eval do
    # your controller logic goes here
    #homepage
    before_filter :find_all_hero_images, :only => [:home]
    #before_filter :find_featured_portfolio, :only => [:home]
      protected
           def find_all_hero_images
             @homepage_hero_items = Refinery::HeroImages::HeroImage.find(:all, :limit => 4, :order=> "position")
           end
          # def find_featured_portfolio
          #   @featured_portfolios = Refinery::Portfolio::Gallery.find(:all, :limit => 3, :order=>"lft")
          # end
      end