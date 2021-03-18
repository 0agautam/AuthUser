class AddDojToEmployees < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :doj, :integer
  end
end
