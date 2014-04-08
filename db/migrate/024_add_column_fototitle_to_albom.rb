class AddColumnFototitleToAlbom < ActiveRecord::Migration
  def self.up
    add_attachment :alboms, :fototitle
  end

  def self.down
    remove_attachment :alboms, :fototitle
  end
end
