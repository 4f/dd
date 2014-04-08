class TranslateFlag < ActiveRecord::Migration
  def up
    Flag.create_translation_table!({
      country: :string, 
      }, {
        migrate_data: true
        })
  end

  def down
    Flag.drop_translation_table! migrate_data: true
  end
end
