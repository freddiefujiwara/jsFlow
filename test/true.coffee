should = require 'should'
sinon  = require 'sinon'
Pipable  = require("../src/pipable").Pipable
True = require("../src/true").True

describe 'True', ->
    t = null
    p = null

    beforeEach ->
       t = new True
       p = new Pipable

    afterEach ->
       Pipable.start = false
       Pipable.pipes = []
       Pipable.exit  = false

    it "should be a True object", ->
        t.should.be.a "object"

    it "runs" , ->
       Pipable.start = true
       p+t+p
       Pipable.run()
       should.equal p.status.count,2
