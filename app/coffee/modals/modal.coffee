module.exports = class Modal

  constructor: () ->
  build : () ->
    @$node.find(".cancel-x").click (e) => @main.hide()
    @$node.find(".cancel").click (e) => @main.hide()
    @$node.find(".save").click (e) => @main.submit(@options)
