# This migration comes from refinery_reports (originally 10)
class CreateReportsLinks < ActiveRecord::Migration

  def up
    create_table :refinery_reports_links do |t|
      t.string :title
      t.string :url

      t.references :report

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-reports"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/reports/links"})
    end

    drop_table :refinery_reports_links

  end

end
