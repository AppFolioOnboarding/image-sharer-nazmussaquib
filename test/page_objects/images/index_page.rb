module PageObjects
  module Images
    class IndexPage < PageObjects::Document
      path :images
      # rubocop:disable LineLength
      collection :images, locator: '.image-collection', item_locator: '.image-container', contains: PageObjects::Images::ImageCard do
        # rubocop:enable LineLength
        def view!
          node.click_on('View')
          window.change_to(ShowPage)
        end
      end

      def add_new_image!
        node.click_on('New Image')
        window.change_to(NewPage)
      end

      def showing_image?(link: nil, tags: nil)
        image_tags = nil
        link_present = node.has_css?("img[src='#{link}']")
        if link_present
          image_container = node.find("img[src='#{link}']").find(:xpath, '..')
          image_tags = image_container.all('.image-tags').map(&:text) if tags.present?
        end
        link_present && image_tags == tags
      end

      def clear_tag_filter!
        node.click_on('Image List')
        window.change_to(IndexPage)
      end
    end
  end
end
