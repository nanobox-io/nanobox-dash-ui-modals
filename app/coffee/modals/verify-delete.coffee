view = require 'jade/modals/verify-delete'

#
module.exports = class VerifyDeleteModal

  #
  constructor: (@$el, @options={}, @main) ->

    #
    @$node = $(view(@options))
    @$el.append @$node

    # we don't build here because this view is loaded from main, which calls a
    # build as part of the view loading

  #
  build : () -> @_handleInput()

  # _handleInput will toggle the delete button based on the value in the input
  # field. The idea here is that a person has to verify what they are deleting
  _handleInput: () ->

    #
    $button = @$node.find("button.delete")

    # delete modals
    @$node.find("input").keyup (e) =>
      if @options.name == e.currentTarget.value
        $button.removeClass("disabled")
      else $button.addClass("disabled")
