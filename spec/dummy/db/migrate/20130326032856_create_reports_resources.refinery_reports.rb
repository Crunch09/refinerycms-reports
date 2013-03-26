# This migration comes from refinery_reports (originally 8)
class CreateReportsResources < ActiveRecord::Migration

  def up
    create_table :refinery_reports_resources do |t|
      t.references :report
      t.references :usable, polymorphic: true

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-reports"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/reports/resources"})
    end

    drop_table :refinery_reports_resources

  end

end
