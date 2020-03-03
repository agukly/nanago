class ConversationsController < ApplicationController

def index
  @conversations = policy_scope(Conversation)
  @conversation = Conversation.new
end

def show
  @conversation = Conversation.find(params[:id])
  @messages = @conversation.messages
  authorize @conversation
  @message = Message.new
end

def new
  @conversation = Conversation.new
  authorize @conversation
end

def create
 if Conversation.between(params[:sender_id],params[:recipient_id])
   .present?
    @conversation = Conversation.between(params[:sender_id],
     params[:recipient_id]).first
 else
  @conversation = Conversation.create!(conversation_params)
 end
 authorize @conversation
 redirect_to conversation_path(@conversation)
end
private
 def conversation_params
  params.require(:conversation).permit(:sender_id, :recipient_id)
 end
end
