view = require 'jade/modals/upgrade-required-modal'

#
module.exports = class UpgradeRequiredModal

  #
  constructor: (@$el, @options={}, @main) ->

    #
    @options.callToAction ||= "Continue"

    #
    @$node = $(view(@options))
    @$el.append @$node

  #
  build : () ->

    #
    @$node.find(".cancel").click (e) => @main.hide()

    #
    @$node.find("button.save").click (e) => @main.submit(@options)
