class TranslatePartner < ActiveRecord::Migration
  def up
    Partner.create_translation_table!({
      text: :text, 
      logo: :string,
      name: :string,
      }, {
        migrate_data: true
        })
  end

  def down
    Partner.drop_translation_table! migrate_data: true
  end
end
