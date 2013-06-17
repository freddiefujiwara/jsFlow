"use strict"
root = require "./pipable"

class exports.False extends root.Pipable
    name:"False"
    run:(status) ->
        status.next = false
        @status = status
