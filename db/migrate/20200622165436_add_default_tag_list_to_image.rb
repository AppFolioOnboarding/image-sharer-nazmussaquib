class AddDefaultTagListToImage < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      INSERT INTO tags (name) VALUES ('default');
    SQL
    blank_img_ids.each do |img_id|
      execute <<-SQL
        INSERT INTO taggings (tag_id, taggable_id, taggable_type, context)
        VALUES (#{default_tag_id['id']}, #{img_id['id']}, 'Image', 'tags');
      SQL
    end
    execute <<-SQL
      UPDATE tags SET taggings_count = taggings_count + #{img_ids.length}
      WHERE id = #{default_tag_id['id']};
    SQL
  end

  def down
    execute <<-SQL
      DELETE
      FROM taggings
      WHERE tag_id = #{default_tag_id['id']};
    SQL
    execute <<-SQL
      DELETE
      FROM tags
      WHERE id = #{default_tag_id['id']};
    SQL
  end

  private

  def default_tag_id
    @default_tag_id ||= select_one <<-SQL
      SELECT id FROM tags WHERE name = 'default';
    SQL
  end

  def blank_img_ids
    @blank_img_ids ||= select_all <<-SQL
      SELECT id FROM images WHERE id NOT IN
      (SELECT taggable_id FROM taggings WHERE taggable_type = 'Image');
    SQL
  end
end
