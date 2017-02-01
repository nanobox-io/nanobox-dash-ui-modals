view  = require 'jade/modals/delete-confirmation-modal'
Modal = require 'modals/modal'

module.exports = class DeleteConfirmationModal extends Modal

  constructor: (@$el, @options={}, @main) ->
    @options.callToAction ||= "Delete"
    @$node = $(view(@options))
    @$el.append @$node
    super()
