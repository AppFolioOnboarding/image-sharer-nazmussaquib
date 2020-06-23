module PageObjects
  module Images
    class NewPage < PageObjects::Document
      path :new_image
      path :images # form failed create

      form_for :image do
        element :link, error_html: { class: 'invalid-feedback' }
        element :tag_list, error_html: { class: 'invalid-feedback' }
      end

      def create_image!(link: nil, tags: nil)
        self.link.set(link) if link.present?
        tag_list.set(tags) if tags.present?
        node.click_on('Create Image')
        window.change_to(ShowPage, self.class)
      end
    end
  end
end
