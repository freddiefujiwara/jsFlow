"use strict"
root = require "./pipable"
$ = $ ? require 'jquery'

class exports.True extends root.Pipable
    name:"True"
    run:(status) ->
        d = $.Deferred()
        d.then (status) ->
          status.next = true
          d.resolve status
        setTimeout () ->
          d.resolve status

        d.promise()
