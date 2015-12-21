class MessagesController < ApplicationController
 

  def last
    msg = Message.where(processed: :false).asc(:created_at).first
    
    if !msg
      offset = rand(Message.where(favorited: :true).count)
      msg = Message.where(favorited: :true).offset(offset).first
      if !msg
        msg = Message.first
      end
    else
      msg.processed = true
      msg.save
    end

    msg.url = msg.the_gif.path

    respond_to do |format|
      format.json  {render json: msg}
    end
  end

  def new
    @message = Message.new
  end
  
  def create
    @message = Message.new(message_params)
    @message.save
    redirect_to thanks_path
  end


  private
    def message_params
      params.require(:message).permit(:name, :body, :the_gif)
    end

end
