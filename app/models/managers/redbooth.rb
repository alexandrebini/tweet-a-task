module Managers
  class Redbooth < Manager
    class Api
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
      response = api.create_task(task.name)
      if response.code.to_i == 201
        self.raw = response.body.to_json
        self.status = :success
      else
        p '-------------------------else'
        p response.headers.to_json

        self.raw = response.headers.to_json
        self.status = :error
      end
      self.save
    end

    private
    def api
      @api ||= Api.new
    end
  end
end