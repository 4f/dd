class AddColomnToHome < ActiveRecord::Migration
  def change
    add_column :homes, :announcement, :string
  end
end
