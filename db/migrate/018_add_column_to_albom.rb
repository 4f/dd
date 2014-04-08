class AddColumnToAlbom < ActiveRecord::Migration
  def change
    add_column :alboms, :mainfoto, :integer
  end
end
