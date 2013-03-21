class CreateReportsDepartments < ActiveRecord::Migration

  def up
    create_table :refinery_reports_departments do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-reports"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/reports/departments"})
    end

    drop_table :refinery_reports_departments

  end

end
