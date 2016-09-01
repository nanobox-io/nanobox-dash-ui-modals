view = require 'jade/modals/delete-confirmation-modal'

#
module.exports = class DeleteConfirmationModal

  #
  constructor: (@$el, @options={}, @main) ->

    #
    @options.callToAction ||= "Delete"

    #
    @$node = $(view(@options))
    @$el.append @$node

  #
  build : () ->

    #
    @$node.find(".cancel").click (e) => @main.hide()

    #
    @$node.find("button.delete").click (e) => @main.submit(@options)
