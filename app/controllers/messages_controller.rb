class MessagesController < ApplicationController
  def index
    @messages = Message.page(params[:page]).per(10)
  end

  def show
    @messages = Message.find(params[:id])
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

  protected

  def message_params
    params.require(:message).permit(:title, :content, :category_name)
  end
end
