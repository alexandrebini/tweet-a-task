class Api::ManagersController < Api::BaseController
  def index
    @managers = if params[:task_id]
      Manager.where(task_id: params[:task_id])
    else
      Manager.all
    end
    render json: @managers, each_serializer: ManagerSerializer
  end
end