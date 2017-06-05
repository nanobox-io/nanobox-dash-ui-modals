view = require 'jade/modals/upgrade-required-modal'
Modal = require 'modals/modal'

module.exports = class UpgradeRequiredModal extends Modal

  constructor: (@$el, @options={}, @main) ->
    super()

    #
    @options.actionTxt ||= "Manage Upgrades"
    @options.cancelTxt ||= "Cancel"

    #
    @$node = $(view(@options))
    @$el.append @$node
