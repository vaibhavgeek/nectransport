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
    session[:name] = params[:n]
    @messages = Message.all
    @message = Message.new
  end

  def notif 
    puts params 
    puts "\n\n\n"
    if params[:format] == "send"
      ActionCable.server.broadcast 'room_channel', content: "1" , userid: session[:query] , name: session[:name]
    elsif params[:format] == "accept"
      ActionCable.server.broadcast 'room_channel', content: "2" , userid: session[:query] , name: session[:name]
    elsif params[:format] == "reject"
      ActionCable.server.broadcast 'room_channel', content: "3" , userid: session[:query] , name: session[:name]
    else
      ActionCable.server.broadcast 'room_channel', content: "4" , userid: session[:query] , name: session[:name]
      
    end
  end

  def notify
  end
end
