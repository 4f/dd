class TranslateHelpPage < ActiveRecord::Migration
  def up
    HelpPage.create_translation_table!({
      text: :text, 
      title: :string,
      req: :text,
      }, {
        migrate_data: true
        })
  end

  def down
    HelpPage.drop_translation_table! migrate_data: true
  end
end
