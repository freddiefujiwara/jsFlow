"use strict"
root = exports ? window
$ = $ ? require 'jquery'

class root.Pipable
    name:"Pipable"
    @pipes:[]
    @start:false
    @run: ->
      status = {next:true,pipes:Pipable.pipes,exit:false}
      deferredQueue = $.Deferred()
      last = deferredQueue
      for pipe in Pipable.pipes
        last = last.then (status) ->
          pipe = status.pipes.shift()
          pipe.run status

      deferredQueue.resolve status
      last

    valueOf: ->
      if Pipable.start
        Pipable.pipes.push @

    run:(status) ->
        d = $.Deferred()
        return d.resolve(status).promise() if status.exit
        d.then (status) ->
          if status.next
            status.count = if status.count then status.count + 1 else 1
          status.next = true
          status

        setTimeout () ->
          d.resolve status

        d.promise()
