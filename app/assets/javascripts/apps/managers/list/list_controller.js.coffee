@TweetATask.module 'ManagersApp.List', (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base
    initialize: (taskId) ->
      @managers = App.request 'manager:entities', taskId
      @layout = @getLayoutView()

      @listenTo @layout, 'show', =>
        App.execute 'when:fetched', @managers, =>
          @managersRegion()

      App.managersRegion.show @layout

    managersRegion: ->
      managersView = @getManagersView()
      @layout.managerListRegion.show managersView

    getLayoutView: ->
      new List.Layout

    getManagersView: ->
      new List.ManagersView(collection: @managers)