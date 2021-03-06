
# modals
ActionConfirmationModal = require 'modals/action-confirmation-modal'
DeleteConfirmationModal = require 'modals/delete-confirmation-modal'
DeleteVerificationModal = require 'modals/delete-verification-modal'
InfoModal               = require 'modals/info-modal'
UpgradeRequiredModal    = require 'modals/upgrade-required-modal'

#
class Modals

  # builds the initial state of the component
  constructor : (@$body) ->

    # get all modal DOM elements
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

  # load will load and show a new modal
  load : (@options={}) =>

    # empty out the previous modal
    @$modal.empty()

    # create the desired modal
    modal = switch @options.modal
      when "action-confirmation-modal" then new ActionConfirmationModal @$modal, @options, @
      when "delete-confirmation-modal" then new DeleteConfirmationModal @$modal, @options, @
      when "delete-verification-modal" then new DeleteVerificationModal @$modal, @options, @
      when "info-modal"                then new InfoModal @$modal, @options, @
      when "upgrade-required-modal"    then new UpgradeRequiredModal @$modal, @options, @
      else console.warn("Warning: #{options.modal} not found!")

    # build the new modal
    modal?.build()

    # show the modal
    @show()

    # return the modal
    return @

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
  hide : (doCallOnClose=true) =>

    # detach the modal
    @$modal.velocity {opacity:0}, {duration:150, complete:() => @$modal.detach()}

    # detach the shield
    @$shield.velocity {opacity:0}, {duration:150, complete:() => @$shield.detach()}

    # enable page scrolling
    @$body.removeClass("no-scroll")

    #
    if doCallOnClose
      @options.onClose?()

  #
  submit : (options={}) => @options.onSubmit?(); @hide(false)


#
window.nanobox ||= {}
nanobox.Modals = new Modals($('body'))
