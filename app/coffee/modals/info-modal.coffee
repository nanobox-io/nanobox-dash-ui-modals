view = require 'jade/modals/info-modal'
Modal = require 'modals/modal'

module.exports = class InfoModal extends Modal

  constructor: (@$el, @options={}, @main) ->
    super()

    #
    @options.actionTxt ||= "Continue"
    @options.cancelTxt ||= "Cancel"

    #
    @$node = $(view(@options))
    @$el.append @$node
