class AddColumnToConcert < ActiveRecord::Migration
  def change
    add_column :concerts, :title2, :string
  end
end
