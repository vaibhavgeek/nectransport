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
    @messages = Message.all
    @message = Message.new
  end

  def notify
  end
end
