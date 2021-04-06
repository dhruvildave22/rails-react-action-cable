class MessagePresenter
  attr_reader :message

  def initialize(message)
    @message = message
  end

  def _show(options = {})
    response = {
      id: message.id,
      text: message.text,
      conversation_id: message.conversation_id,
      created_at: message.created_at,
    }
    response
  end
end