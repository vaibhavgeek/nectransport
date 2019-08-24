class HomeController < ApplicationController
  def index
  end

  def login
  end

  def form
  end

  def matches
  end

  def chat
    session[:query] = params[:q]
    @messages = Message.all
    @message = Message.new
  end

  def notif 
    puts params 
    puts "\n\n\n"
    if params[:format] == "send"
      ActionCable.server.broadcast 'room_channel', content: "1" , userid: session[:query]
    elsif params[:format] == "accept"
      ActionCable.server.broadcast 'room_channel', content: "2" , userid: session[:query]
    elsif params[:format] == "reject"
      ActionCable.server.broadcast 'room_channel', content: "3" , userid: session[:query]
    else
      ActionCable.server.broadcast 'room_channel', content: "4" , userid: session[:query]
      
    end
  end

  def notify
  end
end
