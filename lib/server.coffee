
DEBUG = true

class @Counter

  _collectionName: '_counters'


  constructor: (@name, @cursor, @interval = 3*1000) ->


  _getCollectionName: =>
    console.log("Counter _getCollectionName", @name) if DEBUG
    "counter-#{@name}"


  _publishCursor: (sub) =>
    count = @cursor.count()

    console.log("Counter publishCursor", @_collectionName, @name, count) if DEBUG
    
    sub.added @_collectionName, @name,
      count: count
    
    handler = Meteor.setInterval =>
      count = @cursor.count()
      console.log("Counter publishCursor update", @_collectionName, @name, count) if DEBUG
      sub.changed @_collectionName, @name,
        count: count
    , @interval

    sub.onStop ->
      Meteor.clearTimeout handler