# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "HeroImages" do
    describe "Admin" do
      describe "hero_images" do
        login_refinery_user

        describe "hero_images list" do
          before do
            FactoryGirl.create(:hero_image, :title => "UniqueTitleOne")
            FactoryGirl.create(:hero_image, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.hero_images_admin_hero_images_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.hero_images_admin_hero_images_path

            click_link "Add New Hero Image"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::HeroImages::HeroImage.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::HeroImages::HeroImage.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:hero_image, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.hero_images_admin_hero_images_path

              click_link "Add New Hero Image"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::HeroImages::HeroImage.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:hero_image, :title => "A title") }

          it "should succeed" do
            visit refinery.hero_images_admin_hero_images_path

            within ".actions" do
              click_link "Edit this hero image"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:hero_image, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.hero_images_admin_hero_images_path

            click_link "Remove this hero image forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::HeroImages::HeroImage.count.should == 0
          end
        end

      end
    end
  end
end
