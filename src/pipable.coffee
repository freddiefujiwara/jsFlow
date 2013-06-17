"use strict"
root = exports ? window

class @Pipable
    @pipes:[]
    @status:{}
    @start:false
    @exit:false
    @run: ->
      status = {next:true}
      for pipe in Pipable.pipes
        unless Pipable.exit
          status =  pipe.run status

    valueOf: ->
      if Pipable.start
        Pipable.pipes.push @

    run:(status) ->
        if status.next
          status.count = if status.count then status.count + 1 else 1
        status.next = true
        @status = status
