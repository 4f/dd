class TranslateConcert < ActiveRecord::Migration
  def up
    Concert.create_translation_table!({
      text1: :text, 
      text2: :text,
      text3: :text,
      title: :string,
      title2: :string,
      home_pre: :text,
      home_after: :text
      }, {
        migrate_data: true
        })
  end

  def down
    Concert.drop_translation_table! migrate_data: true
  end
end
