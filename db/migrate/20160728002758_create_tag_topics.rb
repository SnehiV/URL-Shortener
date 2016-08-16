class CreateTagTopics < ActiveRecord::Migration
  def change
    create_table :tag_topics do |t|
      t.string :topic
      t.timestamps null: false
    end

    create_table :taggings do |t|
      t.string :tag_id
      t.string :url_id
      t.timestamps null: false
    end
  end
end
