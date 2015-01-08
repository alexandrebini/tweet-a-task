@TweetATask.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Task extends Backbone.Model

  class Entities.TaskCollection extends Backbone.Collection
    model: Entities.Task
    url: '/api/tasks.json'

  API =
    getTasks: (phraseId) ->
      tasks = new Entities.TaskCollection()
      tasks.fetch
        data: { phrase_id: phraseId }
      tasks

  App.reqres.setHandler 'task:entities', (phraseId) ->
    API.getTasks(phraseId)