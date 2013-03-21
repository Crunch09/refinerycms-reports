class AddTypToReports < ActiveRecord::Migration

  def change
    add_column :refinery_reports, :typ, :string
  end

end
