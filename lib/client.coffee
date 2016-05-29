
DEBUG = false


class CounterClass

  constructor: ->
    @_collection = new Meteor.Collection('_counters')

  get: (name) ->
    @_collection.findOne(name)?.count or 0
  

@Counter = new CounterClass()