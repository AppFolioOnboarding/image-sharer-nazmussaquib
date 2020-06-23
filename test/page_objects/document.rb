module PageObjects
  class Document < AePageObjects::Document
    def error_message
      node.find('.invalid-feedback').text
    end

    def flash_message(message_type)
      node.find(".#{message_type}").text
    end
  end
end
