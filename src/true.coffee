"use strict"
root = require "./pipable"

class exports.True extends root.Pipable
    run:(status) ->
        status.next = true
        @status = status
