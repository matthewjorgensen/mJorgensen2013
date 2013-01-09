module Refinery
  module ContactInquiries
    module Admin
      class ContactInquiriesController < Refinery::AdminController

        crudify :'refinery/contact_inquiries/contact_inquiry', 
                :title_attribute => "first_name", 
                :order => "created_at DESC"

        def index
          unless searching?
            find_all_contact_inquiries
          else
            search_all_contact_inquiries
          end

          @grouped_contact_inquiries = group_by_date(@contact_inquiries)
        end

      end
    end
  end
end
