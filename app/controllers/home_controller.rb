class HomeController < ApplicationController
  def index
    @message = Message.new
    if current_user
      @messages = current_user.messages
    end
  end

  def create; end
end
