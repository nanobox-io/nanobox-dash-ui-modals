view = require 'jade/modals/action-confirmation-modal'
Modal = require 'modals/modal'

module.exports = class ActionConfirmationModal extends Modal

  constructor: (@$el, @options={}, @main) ->
    @options.callToAction ||= "Continue"
    @$node = $(view(@options))
    @$el.append @$node
    super()
