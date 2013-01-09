module Refinery
  module ContactInquiries
    class Setting < Refinery::Core::BaseModel

      class << self
        def confirmation_body
          Refinery::Setting.find_or_set(:contact_inquiry_confirmation_body,
            "Thank you for your contact inquiry %name%,\n\nThis email is a receipt to confirm we have received your contact inquiry and we'll be in touch shortly.\n\nThanks."
          )
        end

        def confirmation_subject
          Refinery::Setting.find_or_set(:contact_inquiry_confirmation_subject,
                                        "Thank you for your contact inquiry")
        end

        def confirmation_subject=(value)
          Refinery::Setting.set(:contact_inquiry_confirmation_subject, value)
        end

        def notification_recipients
          Refinery::Setting.find_or_set(:contact_inquiry_notification_recipients,
                                        (Role[:refinery].users.first.try(:email) if defined?(Role)).to_s)
        end

        def notification_subject
          Refinery::Setting.find_or_set(:contact_inquiry_notification_subject,
                                        "New contact inquiry from your website")
        end
      end

    end
  end
end
