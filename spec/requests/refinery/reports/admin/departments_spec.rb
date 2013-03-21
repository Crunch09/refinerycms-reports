# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Reports" do
    describe "Admin" do
      describe "departments" do
        login_refinery_user

        describe "departments list" do
          before do
            FactoryGirl.create(:department, :name => "UniqueTitleOne")
            FactoryGirl.create(:department, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.reports_admin_departments_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.reports_admin_departments_path

            click_link "Add New Department"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Reports::Department.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::Reports::Department.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:department, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.reports_admin_departments_path

              click_link "Add New Department"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Reports::Department.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:department, :name => "A name") }

          it "should succeed" do
            visit refinery.reports_admin_departments_path

            within ".actions" do
              click_link "Edit this department"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:department, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.reports_admin_departments_path

            click_link "Remove this department forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Reports::Department.count.should == 0
          end
        end

      end
    end
  end
end
