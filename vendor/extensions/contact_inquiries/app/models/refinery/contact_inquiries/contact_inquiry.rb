module Refinery
  module ContactInquiries
    class ContactInquiry < Refinery::Core::BaseModel
      self.table_name = 'refinery_contact_inquiries'

      attr_accessible :first_name, :last_name, :email, :message, :position

      acts_as_indexed :fields => [:first_name, :last_name, :email, :message]

      alias_attribute :name, :first_name

      # Add some validation here if you want to validate the user's input
      # We have validated the first string field for you.
      validates :first_name, :presence => true
    end
  end
end
