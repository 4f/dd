class TranslateRubric < ActiveRecord::Migration
  def up
    News::Rubric.create_translation_table!({
      name: :string,
      }, {
        migrate_data: true
        })
  end

  def down
    News::Rubric.drop_translation_table! migrate_data: true
  end
end
