module Refinery
  module Projects
    class Project < Refinery::Core::BaseModel
      self.table_name = 'refinery_projects'

      attr_accessible :title, :teaser, :cover_image_id, :description, :position
      has_many_page_images 

      acts_as_indexed :fields => [:title, :teaser, :description]

      validates :title, :presence => true, :uniqueness => true

      belongs_to :cover_image, :class_name => '::Refinery::Image'
    end
  end
end
