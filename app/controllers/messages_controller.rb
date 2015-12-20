class MessagesController < ApplicationController
 

  def last
    msg = Message.where(processed: :false).asc(:created_at).first
    if !msg
      offset = rand(Message.count)
      msg = Message.offset(offset).first
    else
      msg.processed = true
      msg.save
    end

    msg.url = msg.the_gif.path

    respond_to do |format|
      format.json  {render json: msg}
    end
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      render json: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end

  end

  private
    def message_params
      params.require(:message).permit(:name, :body, :the_gif)
    end
end
