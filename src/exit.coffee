"use strict"
root = require "./pipable"

class exports.Exit extends root.Pipable
    run:(status) ->
        root.Pipable.exit = true
        @status = status
