
# modals
DeleteVerificationModal = require 'modals/delete-verification-modal'
DeleteConfirmationModal = require 'modals/delete-confirmation-modal'
ActionConfirmationModal = require 'modals/action-confirmation-modal'
UpgradeRequiredModal    = require 'modals/upgrade-required-modal'

#
class Modals

  # builds the initial state of the component
  constructor : (@$el) -> # does nothing...

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
  loadAndShow : (@options={}) => @load(@options); @show()

  # load will load a new modal to be shown
  load : (@options={}) =>

    # empty out the previous modal
    @$modal.empty()

    # create the desired modal
    modal = switch @options.modal
      when "delete-verification-modal" then new DeleteVerificationModal @$modal, @options, @
      when "delete-confirmation-modal" then new DeleteConfirmationModal @$modal, @options, @
      when "action-confirmation-modal" then new ActionConfirmationModal @$modal, @options, @
      when "upgrade-required-modal"    then new UpgradeRequiredModal @$modal, @options, @
      else console.warn("Warning: #{options.modal} not found!")

    # build the new modal
    modal?.build()

  # show will show whatever modal is currently loaded
  show : () =>

    # disable page scrolling
    @$body.addClass("no-scroll")

    # attach the dropshield
    @$body.append(@$shield)
    @$shield.velocity {opacity:1}, {duration:300}

    # attach the modal
    @$body.append(@$modal)
    castShadows(@$modal)
    @$modal.velocity {opacity:1}, {duration:300}

    #
    @options.onOpen?()

  #
  hide : () =>

    # detach the modal
    @$modal.velocity {opacity:0}, {duration:150, complete:() => @$modal.detach()}

    # detach the shield
    @$shield.velocity {opacity:0}, {duration:150, complete:() => @$shield.detach()}

    # enable page scrolling
    @$body.removeClass("no-scroll")

    #
    @options.onClose?()

  #
  submit : (options={}) => @_doXHR({url:options.action, type:options.method})

  #
  _doXHR: (options={}) =>
    console.log "DO!"
    $.ajax
      url: options.url
      type: options.type
      success: () =>
        console.log "SUCCESS!"
        @options.onSubmit?()
      done: () =>
        console.log "DONE!"
        @options.onSubmit?()
      error: () =>
        console.log "ERROR!"
      fail: () =>
        console.log "FAIL!"
      complete: () =>
        console.log "COMPLETE!"
        @hide()
      always: () =>
        console.log "ALWAYS!"
        @hide()

#
window.nanobox ||= {}
nanobox.Modals = Modals
