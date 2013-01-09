module Refinery
  module ContactInquiries
    class Mailer < ActionMailer::Base

      def confirmation(contact_inquiry, request)
        @contact_inquiry = contact_inquiry
        mail :subject  => Refinery::ContactInquiries::Setting.confirmation_subject,
             :to       => contact_inquiry.email,
             :from     => "\"#{Refinery::Core.site_name}\" <no-reply@#{request.domain}>",
             :reply_to => Refinery::ContactInquiries::Setting.notification_recipients.split(',').first
      end

      def notification(contact_inquiry, request)
        @contact_inquiry = contact_inquiry
        mail :subject  => Refinery::ContactInquiries::Setting.notification_subject,
             :to       => Refinery::ContactInquiries::Setting.notification_recipients,
             :from     => "\"#{Refinery::Core.site_name}\" <no-reply@#{request.domain}>"
      end

    end
  end
end
