
DEBUG = false

DEFAULT_INTERVAL = 5 # Seconds


class @Counter

  _collectionName: '_counters'


  constructor: (@name, @cursor, @options, @interval = DEFAULT_INTERVAL) ->


  _getCollectionName: ->
    console.log("Counter _getCollectionName", @name) if DEBUG
    "counter-#{@name}"


  _counter: =>
    try
      if @options?.countField
        count = 0
        @cursor.forEach (rec) =>
          count += rec[@options.countField]
        count
      else
        @cursor.count()
    catch e
      console.log("Counter Error on cursor count, #{@name}", @options, e)
      0
    
    



  _publishCursor: (sub) =>

    count = @_counter()

    console.log("Counter publishCursor", @name, count) if DEBUG
    
    sub.added @_collectionName, @name,
      count: count
    
    handler = Meteor.setInterval =>
      count = @_counter()
      console.log("Counter publishCursor update", @name, count) if DEBUG
      sub.changed @_collectionName, @name,
        count: count
    , @interval * 1000

    sub.onStop =>
      console.log("Counter onStop", @name) if DEBUG
      Meteor.clearTimeout handler


  publish: (sub) =>
    @_publishCursor(sub)