view = require 'jade/modals/delete-verification-modal'

#
module.exports = class DeleteVerificationModal

  #
  constructor: (@$el, @options={}, @main) ->

    #
    if @options.callToAction == undefined
      @options.callToAction = "Delete"

    @$node = $(view(@options))
    @$el.append @$node

  # toggle the delete button based on the value in the input field. The idea here is that a person has to verify what they are deleting
  build : () ->

    #
    @$node.find(".cancel").click (e) => @main.hide()

    #
    $button = @$node.find("button.delete")

    # delete modals
    @$node.find("input").keyup (e) =>
      if @options.token == e.currentTarget.value
        $button.removeClass("disabled")
      else $button.addClass("disabled")
