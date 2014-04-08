class TranslateTag < ActiveRecord::Migration
  def up
    News::Tag.create_translation_table!({
      name: :string,
      }, {
        migrate_data: true
        })
  end

  def down
    News::Tag.drop_translation_table! migrate_data: true
  end
end
