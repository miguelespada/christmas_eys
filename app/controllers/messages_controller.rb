class MessagesController < ApplicationController
 

  def last
    msg = Message.where(processed: :false).asc(:created_at).first
    
    if !msg
      offset = rand(Message.count)
      msg = Message.offset(offset).first
      if !msg
        msg = Message.first
      end
    else
      msg.processed = true
      msg.save
    end
    # if !msg
    #   msg = Message.desc(:created_at).first
    # end

    msg.url = msg.the_gif.path

    respond_to do |format|
      format.json  {render json: msg}
    end
  end

  def new
    @message = Message.new

    render :layout => "application_1"
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
