class CreateCricInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :cric_infos do |t|
      t.string :month
      t.string :date
      t.string :match_name

      t.timestamps
    end
  end
end
