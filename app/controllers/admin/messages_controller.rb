class Admin::MessagesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_message, only: [:destroy]

  def index
    @messages = Message.all
  end
  
  def destroy
    @message.destroy
    redirect_to admin_messages_url, notice: 'GIF was successfully destroyed.'
  end

  private
    def set_message
      @message = Message.find(params[:id])
    end
end
