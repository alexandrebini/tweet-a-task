@TweetATask.module 'TasksApp', (TasksApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  class TasksApp.Router extends Marionette.AppRouter
    appRoutes:
      ':phraseId/tasks/' : 'list'

  API =
    list: (phraseId) ->
      if @listController?.phraseId != phraseId
        @listController?.destroy()
        @listController = new TasksApp.List.Controller(phraseId)

  TasksApp.on 'start', ->
    new TasksApp.Router
      controller: API

  App.vent.on 'visit:phrase', (phraseId) ->
    App.vent.trigger 'visit', App.Modules.Routes.getInstance().phrasePath(phraseId)
    App.vent.trigger 'show:tasks', phraseId

  App.vent.on 'show:tasks', (phraseId) ->
    API.list(phraseId)