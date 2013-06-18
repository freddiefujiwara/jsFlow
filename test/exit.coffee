should = require 'should'
sinon  = require 'sinon'
Pipable  = require("../src/pipable").Pipable
Exit = require("../src/exit").Exit
True = require("../src/true").True

describe 'Exit', ->
    e = null
    t = null
    p = null

    beforeEach ->
       e = new Exit
       t = new True
       p = new Pipable

    afterEach ->
       Pipable.start = false
       Pipable.pipes = []
       Pipable.exit  = false

    it "should be a Exit object", ->
        e.should.be.a "object"

    it "runs" , (done) ->
       Pipable.start = true
       p+t+e+t+p
       Pipable.run().then (status)->
         should.equal status.count,1
         done()
