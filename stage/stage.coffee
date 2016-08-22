window.init = () ->

  #
  @options = {}

  #
  modals = new nanobox.Modals $("body"), @options
  modals.build()

  #
  $(".modal-toggle").click (e) =>

    #
    options = {
      modal: $(e.currentTarget).data("modal"),
      modalOptions: {
        name: "Something",
        instructions: "do something with stuff",
        path: "/asdf/asdf",
      }
    }

    #
    modals.loadAndShow(options)
