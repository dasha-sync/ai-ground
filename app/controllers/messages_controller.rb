class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_message, only: %i[edit update]

  def index
    @messages = current_user.messages
  end

  def new
    @message = Message.new
  end

  def edit; end

  def create
    client = HuggingFace::InferenceService.new
    @message = Message.new(message_params)
    @message.user_id = current_user.id
    @message.answer = client.call(@message.body)[0]["generated_text"]

    if @message.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity, error: 'Query message dose not sended for some reasone.'
    end
  end

  def update
    if @message.update(message_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity, error: 'Query message can not be updated for some reasone.'
    end
  end

  private

  def set_message
    @message = current_user.messages.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:body)
  end
end
