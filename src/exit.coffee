"use strict"
root = require "./pipable"

$ = $ ? require 'jquery'
class exports.Exit extends root.Pipable
    name:"Exit"
    run:(status) ->
        d = $.Deferred()
        d.then (status) ->
          status.exit = true
          d.resolve status

        setTimeout () ->
          d.resolve status

        d.promise()
