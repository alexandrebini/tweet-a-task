module Managers
  class Redbooth < Manager
    class API
      include HTTParty
      base_uri 'https://redbooth.com/api/3'

      def create_task(name)
        self.class.post '/tasks',
          body: {
            project_id: ENV['REDBOOTH_PROJECT_ID'],
            task_list_id: ENV['REDBOOTH_TASK_LIST_ID'],
            name: name
          },
          headers: default_headers
      end

      private
      def default_headers
        { 'Authorization' => "Bearer #{ ENV['REDBOOTH_OAUTH_ACCESS_TOKEN'] }" }
      end
    end

    def publish!
      @api ||= API.new
      if @api.create_task(task.name).code == '201'
        success!
      else
        error!
      end
    end
  end
end