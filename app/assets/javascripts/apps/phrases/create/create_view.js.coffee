@TweetATask.module 'PhrasesApp.Create', (Create, App, Backbone, Marionette, $, _) ->

  class Create.Layout extends Marionette.LayoutView
    template: 'phrases/create/templates/layout'
    regions:
      formRegion: '.form-region'

  class Create.FormView extends Marionette.ItemView
    tagName: 'form'
    template: 'phrases/create/templates/form'
    ui:
      'text': 'input[type="text"]'
      'button': 'input[type="submit"]'

    events:
      'submit' : 'submit'
      'click @ui.button' : 'submit'

    submit: (e) ->
      e.preventDefault()
      @trigger 'submit:form', @ui.text.val()