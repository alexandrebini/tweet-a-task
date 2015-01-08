@TweetATask.module 'ManagersApp.List', (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends Marionette.LayoutView
    template: 'managers/list/templates/layout'
    regions:
      managerListRegion: '.manager-list-region'

  class List.ManagerView extends Marionette.ItemView
    tagName: 'li'
    template: 'managers/list/templates/manager'
    triggers:
      'click' : 'clicked'

  class List.EmptyView extends Marionette.ItemView
    tagName: 'li'
    template: 'managers/list/templates/empty'

  class List.ManagersView extends Marionette.CollectionView
    childView: List.ManagerView
    emptyView: List.EmptyView
    tagName: 'ul'