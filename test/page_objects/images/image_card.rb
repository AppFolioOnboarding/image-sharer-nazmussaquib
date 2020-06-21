module PageObjects
  module Images
    class ImageCard < AePageObjects::Element
      def link
        node.find('img')[:src]
      end

      def tags
        # TODO
      end

      def click_tag!(tag_name)
        node.click_on(tag_name)
        window.change_to(IndexPage)
      end
    end
  end
end
