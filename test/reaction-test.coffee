chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'reaction', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()

    require('../src/reaction')(@robot)

  it 'registers a lol listener', ->
    expect(@robot.hear).to.have.been.calledWith(/lol/)
