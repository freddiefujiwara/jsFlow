should = require 'should'
sinon  = require 'sinon'
Pipable = require("../src/pipable").Pipable

describe 'Pipable', ->
    p = null

    beforeEach ->
       p = new Pipable

    afterEach ->
       Pipable.start = false
       Pipable.pipes = []
       Pipable.exit  = false

    it "should be a Pipable object", ->
       should.equal Pipable.start,false
       should.equal Pipable.exit,false

    it "has properties", ->
       should.equal Pipable.pipes.length,0
       p.should.have.property 'valueOf'
       Pipable.start = true
       p + p + p
       should.equal Pipable.pipes.length,3

    it "has static properties", ->
       should.equal typeof Pipable.run, "function"

    it "runs ", ->
       Pipable.start = true

       p-p-p
       

       Pipable.run()
       should.equal p.status.count,3

       p-p-p

       Pipable.exit = true
       Pipable.run()
       should.equal p.status.count,3
