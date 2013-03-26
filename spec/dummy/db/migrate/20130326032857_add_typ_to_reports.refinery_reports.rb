# This migration comes from refinery_reports (originally 9)
class AddTypToReports < ActiveRecord::Migration

  def change
    add_column :refinery_reports, :typ, :string
  end

end
