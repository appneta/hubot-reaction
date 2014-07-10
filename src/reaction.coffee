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

module.exports = (robot) ->

  if process.env.HUBOT_REACTION_ENV?
    REACTIONS = JSON.parse process.env.HUBOT_REACTION_ENV
  else
    robot.logger.warning 'The HUBOT_REACTION_ENV environment variable not set'
    REACTIONS = {}

  for phrase of REACTIONS
    robot.hear RegExp(phrase), (msg) ->
      key = msg.match[0]
      msg.send REACTIONS[key]
