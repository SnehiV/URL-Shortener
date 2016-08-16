class EditUrlIndicies < ActiveRecord::Migration
  def change
    add_index "shortened_urls", ["short_url", "long_url"], unique: true
  end
end
