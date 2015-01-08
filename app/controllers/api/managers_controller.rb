class Api::ManagersController < Api::BaseController
  def index
    @managers = if params[:task_id]
      Manager.where(task_id: params[:task_id]).recent
    else
      Manager.recent
    end
    render json: @managers, each_serializer: ManagerSerializer
  end
end