HAML.globals = ->
  routes = TweetATask.Modules.Routes.getInstance()
  _.extend {}, routes