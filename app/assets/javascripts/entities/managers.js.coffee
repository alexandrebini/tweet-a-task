@TweetATask.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Manager extends Backbone.Model

  class Entities.ManagerCollection extends Backbone.Collection
    model: Entities.Manager
    url: '/api/managers.json'

  API =
    getManagers: (taskId) ->
      managers = new Entities.ManagerCollection()
      managers.fetch
        data: { task_id: taskId }
      managers

  App.reqres.setHandler 'manager:entities', (taskId) ->
    API.getManagers(taskId)