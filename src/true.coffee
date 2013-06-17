"use strict"
root = require "./pipable"

class exports.True extends root.Pipable
    name:"True"
    run:(status) ->
        status.next = true
        @status = status
