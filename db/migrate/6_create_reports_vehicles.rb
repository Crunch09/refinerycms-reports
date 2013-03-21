class CreateReportsVehicles < ActiveRecord::Migration

  def up
    create_table :refinery_reports_vehicles do |t|
      t.string :name
      t.string :short_name

      t.references :department

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-reports"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/reports/vehicles"})
    end

    drop_table :refinery_reports_vehicles

  end

end
