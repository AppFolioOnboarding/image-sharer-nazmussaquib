class AddDefaultTagListToImage < ActiveRecord::Migration[5.2]
  def up
    images = Image.all
    images.each do |image|
      # image.tag_list.add('default') if image.tag_list.empty?
      if image.tag_list.empty?
        image.tag_list.add('default')
        image.save
      end
    end
  end

  def down
    images = Image.all
    images.each do |image|
      if image.tag_list.include?('default')
        image.tag_list.remove('default') 
        image.save
      end
    end
  end
end
