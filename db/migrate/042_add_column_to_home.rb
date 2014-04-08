class AddColumnToHome < ActiveRecord::Migration
  def change
    add_column :homes, :year_id, :integer
  end
end
