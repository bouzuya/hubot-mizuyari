require '../helper'

describe 'mizuyari', ->
  beforeEach (done) ->
    @originalRoom = process.env.HUBOT_MIZUYARI_ROOM
    @originalSchedule = process.env.HUBOT_MIZUYARI_SCHEDULE
    @originalMembers = process.env.HUBOT_MIZUYARI_MEMBERS
    process.env.HUBOT_MIZUYARI_ROOM = 'hitoridokusho'
    process.env.HUBOT_MIZUYARI_SCHEDULE = '* * * * * *'
    process.env.HUBOT_MIZUYARI_MEMBERS = '["bouzuya"]'
    @sinon.stub require('cron'), 'CronJob', (_, callback) =>
      @cronJobCallback = callback
      { start: -> undefined }
    moment = require 'moment'
    @sinon.useFakeTimers moment('2014-07-26').valueOf(), 'Date'
    @kakashi.scripts = [require '../../src/scripts/mizuyari']
    @kakashi.users = [{ id: 'bouzuya', room: 'hitoridokusho' }]
    @kakashi.start().then done, done

  afterEach ->
    process.env.HUBOT_MIZUYARI_ROOM = @originalRoom
    process.env.HUBOT_MIZUYARI_SCHEDULE = @originalSchedule
    process.env.HUBOT_MIZUYARI_MEMBERS = @originalMembers

  describe 'receive "@hubot mizuyari"', ->

    it 'send "@bouzuya mizuyari today!(2014-07-26)"', (done) ->
      sender = id: 'bouzuya', room: 'hitoridokusho'
      message = '@hubot mizuyari'
      @cronJobCallback()
      @kakashi
        .maxCallCount 2
        .receive sender, message
        .then =>
          expect(@kakashi.send).to.have.callCount(2)
          expect(@kakashi.send.firstCall.args[1]).to
            .equal('@bouzuya mizuyari today!(2014-07-26)')
          expect(@kakashi.send.secondCall.args[1]).to
            .equal('2014-07-26 : bouzuya')
        .then (-> done()), done
