# Description
#   A Hubot script for mizuyari.
#
# Dependencies:
#   None
#
# Configuration:
#   "cron": "^1.0.4",
#   "moment": "^2.7.0"
#
# Commands:
#   hubot mizuyari - display the member on duty today
#
# Author:
#   bouzuya <m@bouzuya.net>
#
{CronJob} = require 'cron'
moment = require 'moment'

module.exports = (robot) ->

  room = process.env.HUBOT_MIZUYARI_ROOM
  schedule = process.env.HUBOT_MIZUYARI_SCHEDULE
  members = JSON.parse(process.env.HUBOT_MIZUYARI_MEMBERS ? '[]')

  return unless members.length > 0

  today = null

  robot.respond /mizuyari$/i, (res) ->
    res.send "#{today.date} : #{today.member}" if today?

  new CronJob schedule, ->
    today =
      date: moment().format('YYYY-MM-DD')
      member: members[Math.floor(Math.random() * members.length)]
    robot.messageRoom room, "@#{today.member} mizuyari today!(#{today.date})"
