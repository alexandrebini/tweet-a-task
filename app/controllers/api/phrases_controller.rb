class Api::PhrasesController < Api::BaseController
  def index
    @phrases = Phrase.all
    render json: @phrases
  end

  def show
    @phrase = Phrase.find(params[:id])
    render json: @phrase
  end

  def create
    @phrase = Phrase.new(text: params[:text])
    if @phrase.save
      render json: @phrase
    else
      render json: @phrase, status: :unprocessable_entity
    end
  end
end