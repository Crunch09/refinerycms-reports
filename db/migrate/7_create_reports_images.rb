class CreateReportsImages < ActiveRecord::Migration

  def up
    create_table :refinery_reports_images do |t|
      t.string :photo

      t.references :report

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-reports"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/reports/images"})
    end

    drop_table :refinery_reports_images

  end

end
