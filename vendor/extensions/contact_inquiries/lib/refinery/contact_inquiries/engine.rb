module Refinery
  module ContactInquiries
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::ContactInquiries

      engine_name :refinery_contact_inquiries

      initializer "register refinerycms_contact_inquiries plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "contact_inquiries"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.contact_inquiries_admin_contact_inquiries_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/contact_inquiries/contact_inquiry',
            :title => 'first_name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::ContactInquiries)
      end
    end
  end
end
