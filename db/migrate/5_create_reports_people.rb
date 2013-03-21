class CreateReportsPeople < ActiveRecord::Migration

  def up
    create_table :refinery_reports_people do |t|
      t.string :name
      t.string :position
      t.string :info

      t.references :department

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-reports"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/reports/people"})
    end

    drop_table :refinery_reports_people

  end

end
