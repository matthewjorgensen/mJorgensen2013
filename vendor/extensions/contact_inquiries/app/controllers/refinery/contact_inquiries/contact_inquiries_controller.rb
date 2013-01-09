module Refinery
  module ContactInquiries
    class ContactInquiriesController < ::ApplicationController

      before_filter :find_page, :only => [:create, :new]

      def index
        redirect_to :action => "new"
      end

      def thank_you
        @page = Refinery::Page.find_by_link_url("/contact_inquiries/thank_you", :include => [:parts])
      end

      def new
        @contact_inquiry = ContactInquiry.new
      end

      def create
        @contact_inquiry = ContactInquiry.new(params[:contact_inquiry])

        if @contact_inquiry.save
          begin
            Mailer.notification(@contact_inquiry, request).deliver
          rescue => e
            logger.warn "There was an error delivering the contact_inquiry notification.\n#{e.message}\n"
          end

          if ContactInquiry.column_names.map(&:to_s).include?('email')
            begin
              Mailer.confirmation(@contact_inquiry, request).deliver
            rescue => e
              logger.warn "There was an error delivering the contact_inquiry confirmation:\n#{e.message}\n"
            end
          else
            logger.warn "Please add an 'email' field to ContactInquiry if you wish to send confirmation emails when forms are submitted."
          end

          redirect_to refinery.thank_you_contact_inquiries_contact_inquiries_path
        else
          render :action => 'new'
        end
      end

    protected

      def find_page
        @page = Refinery::Page.find_by_link_url('/contact_inquiries/new', :include => [:parts])
      end

    end
  end
end
