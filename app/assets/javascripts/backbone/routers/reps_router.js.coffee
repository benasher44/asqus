class AsqUs.Routers.RepsRouter extends Backbone.Router
  initialize: (options) ->
    @reps = new AsqUs.Collections.RepsCollection()
    @reps.reset options.rep
    @rep = options.rep
    @model = new AsqUs.Models.Rep()
    @polls = new AsqUs.Collections.PollsCollection()
    @polls.reset options.polls
    this.bind 'all', ->
      console.log 'Route event'
    

  routes:
    "home"      : "home"
    "community" : "community"
    "ask"       : "ask"
    "ask/new"   : "newPoll"
    "answer"    : "answer"
    "new"       : "newRep"
    "index"     : "index"
    ":id/edit"  : "edit"
    ":id"       : "show"
    ".*"        : "index"

  home: ->
    console.log('repHome');
    @view = new AsqUs.Views.Reps.HomeView(rep: @rep, model: @model)
    $('#nav .navItem').removeClass('highlight')
    $('#nav .navItem#homeNav').addClass('highlight')
    $("#reps").html(@view.render().el)

  community: ->
    console.log('community');
    @view = new AsqUs.Views.Reps.CommunityView(rep: @rep, model: @model)
    $('#nav .navItem').removeClass('highlight')
    $('#nav .navItem#communityNav').addClass('highlight')
    $("#reps").html(@view.render().el)

  ask: ->
    console.log('ask');
    @view = new AsqUs.Views.Reps.AskView(rep: @rep, model: @model)
    $('#nav .navItem').removeClass('highlight')
    $('#nav .navItem#askNav').addClass('highlight')
    $("#reps").html(@view.render().el)
    console.log(@polls)
    @view2 = new AsqUs.Views.Polls.ListView(polls: @polls)
    console.log(@view2.render().el)
    $("#poll_list").html(@view2.render().el)
    $("#poll_new").html("")

  newPoll: ->
    console.log('new poll');
    @view = new AsqUs.Views.Polls.NewView(collection: @polls)
    $("#poll_new").html(@view.render().el)

  answer: ->
    console.log('answer');
    @view = new AsqUs.Views.Reps.AnswerView(rep: @rep, model: @model)
    $('#nav .navItem').removeClass('highlight')
    $('#nav .navItem#answerNav').addClass('highlight')
    $("#reps").html(@view.render().el)

  newRep: ->
    console.log('new rep');
    @view = new AsqUs.Views.Reps.NewView(collection: @reps)
    $("#reps").html(@view.render().el)

  index: ->
    console.log('rep index');
    @view = new AsqUs.Views.Reps.IndexView(reps: @reps)
    $("#reps").html(@view.render().el)

  show: (id) ->
    console.log('rep show');
    rep = @reps.get(id)

    @view = new AsqUs.Views.Reps.ShowView(model: rep)
    $("#reps").html(@view.render().el)

  edit: (id) ->
    console.log('rep edit');
    rep = @reps.get(id)

    @view = new AsqUs.Views.Reps.EditView(model: rep)
    $("#reps").html(@view.render().el)
