@TweetATask.module 'ManagersApp', (ManagersApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  class ManagersApp.Router extends Marionette.AppRouter
    appRoutes:
      ':phraseId/tasks/:taskId/managers/' : 'list'

  API =
    list: (phraseId, taskId) ->
      @closeList()
      @listController = new ManagersApp.List.Controller(taskId)
      App.vent.trigger 'show:tasks', phraseId

    closeList: ->
      @listController?.destroy()

  ManagersApp.on 'start', ->
    new ManagersApp.Router
      controller: API

  App.vent.on 'visit:task', (phraseId, taskId) ->
    App.vent.trigger 'visit', App.Modules.Routes.getInstance().taskPath(phraseId, taskId)
    App.vent.trigger 'show:managers', phraseId, taskId

  App.vent.on 'visit:phrase', (phraseId) ->
    API.closeList()

  App.vent.on 'show:managers', (phraseId, taskId) ->
    API.list(phraseId, taskId)