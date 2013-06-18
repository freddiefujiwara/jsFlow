should = require 'should'
sinon  = require 'sinon'
Pipable  = require("../src/pipable").Pipable
False = require("../src/false").False

describe 'False', ->
    f = null
    p = null

    beforeEach ->
       f = new False
       p = new Pipable

    afterEach ->
       Pipable.start = false
       Pipable.pipes = []
       Pipable.exit  = false

    it "should be a False object", ->
        f.should.be.a "object"

    it "runs" , (done) ->
       Pipable.start = true
       p+f+p
       Pipable.run().then (status)->
         should.equal status.count,1
         done()
