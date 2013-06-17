"use strict"
root = require "./pipable"

class exports.False extends root.Pipable
    run:(status) ->
        status.next = false
        @status = status
