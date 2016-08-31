view = require 'jade/modals/upgrade-required-modal'

#
module.exports = class UpgradeRequiredModal

  #
  constructor: (@$el, @options={}, @main) ->

    #
    if @options.callToAction == undefined
      @options.callToAction = "Continue"

    @$node = $(view(@options))
    @$el.append @$node

  #
  build : () ->

    #
    @$node.find(".cancel").click (e) => @main.hide()

    #
    @$node.find("button").click (e) => @options.onSubmit?()
