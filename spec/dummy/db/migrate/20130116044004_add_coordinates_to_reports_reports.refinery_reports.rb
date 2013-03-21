# This migration comes from refinery_reports (originally 3)
class AddCoordinatesToReportsReports < ActiveRecord::Migration

  def change
    add_column :refinery_reports, :coordinates, :string
  end

end
