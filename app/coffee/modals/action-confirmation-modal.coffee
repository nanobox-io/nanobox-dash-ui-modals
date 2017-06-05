view = require 'jade/modals/action-confirmation-modal'
Modal = require 'modals/modal'

module.exports = class ActionConfirmationModal extends Modal

  constructor: (@$el, @options={}, @main) ->
    super()

    #
    @options.actionTxt ||= "Continue"
    @options.cancelTxt ||= "Cancel"

    #
    @$node = $(view(@options))
    @$el.append @$node
