"use strict"
root = require "./pipable"

class exports.Exit extends root.Pipable
    name:"Exit"
    run:(status) ->
        status.exit = true
        @status = status
