@TweetATask.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Phrase extends Backbone.Model
    url: '/api/phrases.json'

  class Entities.PhraseCollection extends Backbone.Collection
    @getInstance: -> @_instance ?= new @(arguments...)
    model: Entities.Phrase
    url: '/api/phrases.json'

  API =
    getPhrases: ->
      phrases = Entities.PhraseCollection.getInstance()
      phrases.fetch() unless phrases._fetched?
      phrases

    createPhrase: (text) ->
      phrase = new Entities.Phrase(text: text)
      App.execute 'when:fetched', phrase, ->
        Entities.PhraseCollection.getInstance().add phrase
      phrase.save()
      phrase

  App.reqres.setHandler 'phrase:entities', ->
    API.getPhrases()

  App.reqres.setHandler 'create:phrase', (text) ->
    API.createPhrase(text)