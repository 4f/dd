class AddMembersPagesToConcerts < ActiveRecord::Migration
  def change
    add_column :concerts, :members_page_id, :integer
  end
end
