class RenameDateToMatchDate < ActiveRecord::Migration[6.1]
  def change
    rename_column :cric_infos, :date, :match_date
  end
end
