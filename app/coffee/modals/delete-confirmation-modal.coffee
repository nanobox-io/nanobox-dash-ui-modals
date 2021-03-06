view = require 'jade/modals/delete-confirmation-modal'
Modal = require 'modals/modal'

module.exports = class DeleteConfirmationModal extends Modal

  constructor: (@$el, @options={}, @main) ->
    super()

    #
    @options.actionTxt ||= "Delete"
    @options.cancelTxt ||= "Cancel"

    #
    @$node = $(view(@options))
    @$el.append @$node
