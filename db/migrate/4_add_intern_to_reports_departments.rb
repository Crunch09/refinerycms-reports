class AddInternToReportsDepartments < ActiveRecord::Migration

  def change
    add_column :refinery_reports_departments, :intern, :boolean, default: true
  end

end
