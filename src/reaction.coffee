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
    CONFIG = JSON.parse process.env.HUBOT_REACTION_ENV
  else
    robot.logger.warning 'The HUBOT_REACTION_ENV environment variable not set'
    CONFIG = {}

  REACTIONS = {}
  for k, v of CONFIG
    REACTIONS[k.toLowerCase()] = v

  for phrase of REACTIONS
    phrase = phrase.toLowerCase()
    robot.hear RegExp(phrase, 'i'), (msg) ->
      key = msg.match[0].toLowerCase()
      msg.send REACTIONS[key]
