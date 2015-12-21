class Admin::MessagesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_message, only: [:destroy]

  def index
    @messages = Message.all.paginate(:page => params[:page], :per_page => 20)
    render :layout => "admin"
  end
  
  def destroy
    @message.destroy
    redirect_to admin_messages_url, notice: 'GIF was successfully destroyed.'
  end

  def favorite
    @message = Message.find(params[:message_id])
    @message.favorited = true
    @message.save
    redirect_to admin_messages_path
  end

  def unfavorite
    @message = Message.find(params[:message_id])
    @message.favorited = false
    @message.save
    redirect_to admin_messages_path
  end

  private
    def set_message
      @message = Message.find(params[:id])
    end
end
