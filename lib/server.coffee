
DEBUG = false

DEFAULT_INTERVAL = 5 # Seconds


class @Counter

  _collectionName: '_counters'


  constructor: (@name, @cursor, @interval = DEFAULT_INTERVAL) ->


  _getCollectionName: ->
    console.log("Counter _getCollectionName", @name) if DEBUG
    "counter-#{@name}"


  _publishCursor: (sub) =>
    count = @cursor.count()

    console.log("Counter publishCursor", @name, count) if DEBUG
    
    sub.added @_collectionName, @name,
      count: count
    
    handler = Meteor.setInterval =>
      count = @cursor.count()
      console.log("Counter publishCursor update", @name, count) if DEBUG
      sub.changed @_collectionName, @name,
        count: count
    , @interval * 1000

    sub.onStop =>
      console.log("Counter onStop", @name) if DEBUG
      Meteor.clearTimeout handler


  publish: (sub) =>
    @_publishCursor(sub)