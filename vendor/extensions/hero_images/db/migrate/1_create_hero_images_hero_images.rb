class CreateHeroImagesHeroImages < ActiveRecord::Migration

  def up
    create_table :refinery_hero_images do |t|
      t.string :title
      t.integer :hero_image_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-hero_images"})
    end

    drop_table :refinery_hero_images

  end

end
