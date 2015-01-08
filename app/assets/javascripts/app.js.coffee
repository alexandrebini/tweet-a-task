@TweetATask = do (Backbone, Marionette) ->
  App = new Marionette.Application

  App.addRegions
    phrasesRegion: '.phrases'
    createPhraseRegion: '.create-phrase'
    tasksRegion: '.tasks'
    managersRegion: '.managers'

  App.addInitializer ->
    App.module('PhrasesApp').start()
    App.module('TasksApp').start()
    App.module('ManagersApp').start()

  App.on 'start', ->
    @startHistory()

  App