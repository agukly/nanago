class MessagesController < ApplicationController
  before_action do
   @conversation = Conversation.find(params[:conversation_id])
  end
def new
 @message = @conversation.messages.new
authorize @message
end
def create
  @message = @conversation.messages.new(message_params)
  @message.user_id = current_user.id

  authorize @message

  if @message.save
    redirect_to conversation_path(@conversation)
  end
end

private
 def message_params
  params.require(:message).permit(:body)
 end
end
