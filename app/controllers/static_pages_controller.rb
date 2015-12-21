class StaticPagesController < ApplicationController
  def home
    render :layout => "application"
  end
  def thanks
    render :layout => "application_2"
  end

end