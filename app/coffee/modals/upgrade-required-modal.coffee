view = require 'jade/modals/upgrade-required-modal'
Modal = require 'modals/modal'

module.exports = class UpgradeRequiredModal extends Modal

  constructor: (@$el, @options={}, @main) ->
    @options.callToAction ||= "Continue"
    @$node = $(view(@options))
    @$el.append @$node
    super()
