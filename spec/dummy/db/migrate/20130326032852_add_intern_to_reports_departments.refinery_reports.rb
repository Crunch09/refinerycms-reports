# This migration comes from refinery_reports (originally 4)
class AddInternToReportsDepartments < ActiveRecord::Migration

  def change
    add_column :refinery_reports_departments, :intern, :boolean, default: true
  end

end
