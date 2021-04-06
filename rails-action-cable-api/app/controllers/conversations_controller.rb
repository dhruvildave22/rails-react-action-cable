class ConversationsController < ApplicationController
  def index
    render json: Conversation.all.map { |conversation| ConversationPresenter.new(conversation)._show(messages_included: true) } , status: :ok
  end

  def create
    conversation = Conversation.new(conversation_params)
    if conversation.save
      serialized_data = ConversationPresenter.new(conversation)._show(messages_included: true)
      ActionCable.server.broadcast 'conversations_channel', serialized_data
      head :ok
    end
  end

  private
  
  def conversation_params
    params.require(:conversation).permit(:title)
  end
end
