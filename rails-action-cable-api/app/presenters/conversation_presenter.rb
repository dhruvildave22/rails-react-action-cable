class ConversationPresenter
  attr_reader :conversation

  def initialize(conversation)
    @conversation = conversation
  end

  def _show(options = {})
    response = {
      id: conversation.id,
      text: conversation.title,
    }
    response[:messages] = conversation.messages.map { |message| MessagePresenter.new(message)._show } if options[:messages_included]
    response
  end
end