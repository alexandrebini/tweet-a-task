class Api::TasksController < Api::BaseController
  def index
    @tasks = if params[:phrase_id]
      Task.where(phrase_id: params[:phrase_id]).recent
    else
      Task.recent
    end
    render json: @tasks
  end
end