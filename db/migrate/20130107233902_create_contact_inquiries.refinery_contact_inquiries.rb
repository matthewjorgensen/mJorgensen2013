# This migration comes from refinery_contact_inquiries (originally 1)
class CreateContactInquiries < ActiveRecord::Migration

  def self.up
    create_table :refinery_contact_inquiries do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.text :message

      t.timestamps
    end

    add_index :refinery_contact_inquiries, :id

    if (seed = Rails.root.join('db', 'seeds', 'contact_inquiries.rb')).exist?
      load(seed)
    end
  end

  def self.down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "contact_inquiries"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/contact_inquiries"})
    end

    drop_table :refinery_contact_inquiries
  end

end
