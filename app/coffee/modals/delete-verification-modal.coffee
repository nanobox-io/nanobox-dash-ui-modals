view  = require 'jade/modals/delete-verification-modal'
Modal = require 'modals/modal'

module.exports = class DeleteVerificationModal extends Modal

  constructor: (@$el, @options={}, @main) ->
    @options.callToAction ||= "Delete"
    @$node = $(view(@options))
    @$el.append @$node
    super()

  # toggle the delete button based on the value in the input field. The idea here is that a person has to verify what they are deleting
  build : () ->
    super()
    $button = @$node.find("button.delete")
    @$node.find("input").keyup (e) =>
      if @options.token == e.currentTarget.value
        $button.removeClass("disabled")
      else $button.addClass("disabled")
