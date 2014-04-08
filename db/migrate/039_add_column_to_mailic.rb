class AddColumnToMailic < ActiveRecord::Migration
  def change
    add_column :mailics, :ip, :string
  end
end
