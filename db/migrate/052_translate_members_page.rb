class TranslateMembersPage < ActiveRecord::Migration
  def up
    MembersPage.create_translation_table!({
      text_guest: :text, 
      text_lead: :text, 
      text_member: :text,
      }, {
        migrate_data: true
        })
  end

  def down
    MembersPage.drop_translation_table! migrate_data: true
  end
end
