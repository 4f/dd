class CreateFeedRubricTable < ActiveRecord::Migration
def up
 
    create_table :feeds_rubrics, id: false do |t|
        t.references :feed
        t.references :rubric
    end
    add_index :feeds_rubrics, [:feed_id, :rubric_id]
    add_index :feeds_rubrics, :feed_id
    add_index :feeds_rubrics, :rubric_id
  end

  def down
    drop_table :feeds_rubrics
  end
end
