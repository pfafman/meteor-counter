
DEBUG = false


class CounterClass

  constructor: ->
    @_collection = new Meteor.Collection('_counters')
    

  get: (name) =>
    rec = @_collection.findOne
      _id: name
    rec?.count or 0
  

@Counter = new CounterClass()