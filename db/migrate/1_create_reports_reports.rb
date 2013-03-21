class CreateReportsReports < ActiveRecord::Migration

  def up
    create_table :refinery_reports do |t|
      t.string :keyword
      t.string :location
      t.datetime :started_at
      t.datetime :ended_at
      t.boolean :is_running
      t.string :chief
      t.text :report
      t.string :author
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-reports"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/reports/reports"})
    end

    drop_table :refinery_reports

  end

end
