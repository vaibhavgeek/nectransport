class HomeController < ApplicationController
  def index
  end

  def login
  end

  def form
  end

  def matches
  end

    def otp
    account_sid = 'AC183e333499475144942f217d1ae9f611'
  auth_token = 'a545f953327498f11e13150b46290bb3'
  @client = Twilio::REST::Client.new(account_sid, auth_token)
  message = @client.messages.create(
                             from: '14194696424',
                             body: "Your OTP is" + rand(10 ** 4).to_s,
                             to: '+919784072317'
                           )

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
