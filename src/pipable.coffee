"use strict"
root = exports ? window
$ = $ ? require 'jquery'

class root.Pipable
    name:"Pipable"
    @pipes:[]
    @status:{}
    @start:false
    @run: ->
      status = {next:true,pipes:Pipable.pipes,exit:false}
      deferredQueue = $.Deferred()
      for pipe in status.pipes
        deferredQueue.then (status) ->
          pipe = status.pipes.shift()
          unless status.exit
            status = pipe.run status
          status

      deferredQueue.resolve status

    valueOf: ->
      if Pipable.start
        Pipable.pipes.push @

    run:(status) ->
        if status.next
          status.count = if status.count then status.count + 1 else 1
        status.next = true
        @status = status
