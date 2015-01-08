@TweetATask.module 'TasksApp.List', (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base
    initialize: (phraseId) ->
      @phraseId = phraseId
      @tasks = App.request 'task:entities', @phraseId
      @layout = @getLayoutView()

      @listenTo @layout, 'show', =>
        App.execute 'when:fetched', @tasks, =>
          @tasksRegion()

      App.tasksRegion.show @layout

    tasksRegion: ->
      tasksView = @getTasksView()

      @listenTo tasksView, 'childview:clicked', (child) =>
        App.vent.trigger 'visit:task', child.model.get('phrase_id'), child.model.get('id')

      @layout.taskListRegion.show tasksView

    getLayoutView: ->
      new List.Layout

    getTasksView: ->
      new List.TasksView(collection: @tasks)