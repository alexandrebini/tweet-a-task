@TweetATask.module 'TasksApp.List', (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends Marionette.LayoutView
    template: 'tasks/list/templates/layout'
    regions:
      taskListRegion: '.task-list-region'

  class List.TaskView extends Marionette.ItemView
    tagName: 'li'
    template: 'tasks/list/templates/task'
    triggers:
      'click' : 'clicked'

  class List.EmptyView extends Marionette.ItemView
    tagName: 'li'
    template: 'tasks/list/templates/empty'

  class List.TasksView extends Marionette.CollectionView
    childView: List.TaskView
    emptyView: List.EmptyView
    tagName: 'ul'