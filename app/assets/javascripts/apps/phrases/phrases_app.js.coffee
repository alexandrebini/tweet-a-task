@TweetATask.module 'PhrasesApp', (PhrasesApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  API =
    start: ->
      @create()
      @list()

    list: ->
      @listController ||= new PhrasesApp.List.Controller()

    create: ->
      @createController ||= new PhrasesApp.Create.Controller()

  PhrasesApp.on 'start', ->
    API.start()
