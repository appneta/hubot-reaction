# Description
#   Make hubot react in a hilarious way!
#
# Dependencies
#   None
#
# Configuration:
#   HUBOT_REACTION_ENV
#
#   HUBOT_REACTION_ENV should be in JSON i.e. '{ "foo": "deploy-foo" }'
#
# Notes:
#   None
#
# Author:
#   danriti

REACTIONS = JSON.parse process.env.HUBOT_REACTION_ENV

module.exports = (robot) ->
  for phrase of REACTIONS
    robot.hear RegExp(phrase), (msg) ->
      key = msg.match[0]
      msg.send REACTIONS[key]
