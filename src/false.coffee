"use strict"
root = require "./pipable"
$ = $ ? require 'jquery'

class exports.False extends root.Pipable
    name:"False"
    run:(status) ->
        d = $.Deferred()
        d.then (status) ->
          status.next = false
          d.resolve status
        setTimeout () ->
          d.resolve status

        d.promise()
