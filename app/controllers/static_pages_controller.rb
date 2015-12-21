class StaticPagesController < ApplicationController
  def home
    render :layout => "application"
  end
  def thanks
    render :layout => "application_2"
  end
  def plantilla
    render :layout => false
  end

end