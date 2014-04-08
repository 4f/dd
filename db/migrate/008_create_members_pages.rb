class CreateMembersPages < ActiveRecord::Migration
  def change
    create_table :members_pages do |t|
      t.text :text_lead
      t.text :text_guest
      t.text :text_member

      t.timestamps
    end
  end
end
