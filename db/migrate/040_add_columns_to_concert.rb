class AddColumnsToConcert < ActiveRecord::Migration
  def change
    add_column :concerts, :home_pre, :text
    add_column :concerts, :home_after, :text
  end
end
