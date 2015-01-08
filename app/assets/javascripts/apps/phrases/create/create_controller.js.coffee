@TweetATask.module 'PhrasesApp.Create', (Create, App, Backbone, Marionette, $, _) ->

  class Create.Controller extends App.Controllers.Base
    initialize: ->
      @layout = @getLayoutView()
      @listenTo @layout, 'show', =>
        @formRegion()

      App.createPhraseRegion.show @layout

    formRegion: ->
      formView = @getFormView()

      @listenTo formView, 'submit:form', (text) ->
        App.request 'create:phrase', text

      @layout.formRegion.show formView

    getLayoutView: ->
      new Create.Layout

    getFormView: ->
      new Create.FormView()