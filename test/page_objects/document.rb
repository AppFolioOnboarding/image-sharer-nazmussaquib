module PageObjects
  class Document < AePageObjects::Document
    def error_message(message)
      found = false
      node.all('.invalid-feedback').map do |n|
        found = true if n.text == message
      end
      found
    end

    def flash_message(message_type)
      node.find(".#{message_type}").text
    end
  end
end
