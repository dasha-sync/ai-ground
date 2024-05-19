class HomeController < ApplicationController
  def index
    @message = Message.new
    @messages = current_user.messages
  end

  def create; end
end
