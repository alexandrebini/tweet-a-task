@TweetATask.module 'PhrasesApp.List', (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends Marionette.LayoutView
    template: 'phrases/list/templates/layout'
    regions:
      phraseListRegion: '.phrase-list-region'

  class List.PhraseView extends Marionette.ItemView
    tagName: 'li'
    template: 'phrases/list/templates/phrase'
    triggers:
      'click' : 'clicked'

  class List.EmptyView extends Marionette.ItemView
    tagName: 'li'
    template: 'phrases/list/templates/empty'

  class List.PhrasesView extends Marionette.CollectionView
    childView: List.PhraseView
    emptyView: List.EmptyView
    tagName: 'ul'