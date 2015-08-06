class MessagesController < ApplicationController
  def index
    @messages = Message.page(params[:page]).per(10)
  end

  def show
    @message = Message.find(params[:id])
    @comment = Comment.new
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.save!
    redirect_to root_path
  end

  def edit
    @message = current_user.messages.find(params[:id])
  end

  def update
    @message = current_user.messages.find(params[:id])
    @message.update!(message_params)
    redirect_to message_path(@message)
  end

  def destroy
    @message = current_user.messages.find(params[:id])
    @message.destroy

    redirect_to root_path
  end
  protected

  def message_params
    params.require(:message).permit(:title, :content, :category_name)
  end
end
