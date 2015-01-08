@TweetATask.module 'PhrasesApp.List', (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base
    initialize: ->
      @phrases = App.request 'phrase:entities'
      @layout = @getLayoutView()

      @listenTo @layout, 'show', =>
        App.execute 'when:fetched', @phrases, =>
          @phrasesRegion()

      App.phrasesRegion.show @layout

    phrasesRegion: ->
      phrasesView = @getPhrasesView()

      @listenTo phrasesView, 'childview:clicked', (child) =>
        App.vent.trigger 'visit:phrase', child.model.get('id')

      @layout.phraseListRegion.show phrasesView

    getLayoutView: ->
      new List.Layout

    getPhrasesView: ->
      new List.PhrasesView(collection: @phrases)