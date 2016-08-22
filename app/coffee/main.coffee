
# modals
VerifyDeleteModal = require 'modals/verify-delete'

#
class Modals

  # builds the initial state of the component
  constructor : (@$el, @options={}) -> # does nothing...

  #
  build : () ->

    # get all modal DOM elements
    @$body    = $(document).find("body")
    @$shield  = $("<div id=\"modalshield\" class=\"shield\" style=\"opacity:0;\"></div>")
    @$modal   = $("
      <div id=\"nanobox-dash-ui-modal\" style=\"opacity:0;\">
        <div class=\"close\">
          <img class=\"shadow-icon\" data-source=\"close-x\"/>
        </div>
      </div>")

    # add event handlers

    # after a modal is opened a "close" button is revealed for closing the modal
    @$modal.find(".close").click (e) => @hide()

    # after a modal is opened a "shield" is placed behind it that acts as a
    # clickable area for closing the modal
    @$shield.click (e) => @hide()

  # loadAndShow
  loadAndShow : (options={}) => @load(options); @show()

  # load will load a new modal to be shown
  load : (options={}) =>

    # empty out the previous modal
    @$modal.empty()

    # create the desired modal
    modal = switch options.modal
      when "verify-delete" then new VerifyDeleteModal @$modal, options.modalOptions

    # build the new modal
    modal.build()

  # show will show whatever modal is currently loaded
  show : () =>

    # disable page scrolling
    @$body.addClass("no-scroll")

    # attach the dropshield
    @$body.append(@$shield)
    @$shield.velocity {opacity:1}, {duration:300}

    # attach the modal
    @$body.append(@$modal)
    castShadows(@$body)
    @$modal.velocity {opacity:1}, {duration:300}

  #
  hide : () =>

    # detach the modal
    @$modal.velocity {opacity:0}, {duration:150, complete:() => @$modal.detach()}

    # detach the shield
    @$shield.velocity {opacity:0}, {duration:150, complete:() => @$shield.detach()}

    # enable page scrolling
    @$body.removeClass("no-scroll")

#
window.nanobox ||= {}
nanobox.Modals = Modals
