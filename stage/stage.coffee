window.init = () ->

  #
  onOpen =   () -> console.log "OPENED!"
  onSubmit = () -> console.log "SUBMITTED!"
  onClose =  () -> console.log "CLOSED!"

  options = {

    #
    info: {
      unauthorized: {
        modal:      "info-modal",
        header:     "Unauthorized",
        content:    "You're unauthorized to perform this action. If you feel like you should be able to do this, you'll have to let someone on your team know.",
      }
    },

    #
    upgradeRequired: {
      authorized: {
        modal:      "upgrade-required-modal",
        header:     "Plan Upgrade Required",
        content:    "This action requires you to upgrade this app's plan.",
        authorized: true,
        onOpen:     onOpen,
        onSubmit:   ()-> window.location = '/some/path/to/upgrade'
        onClose:    onClose
      },
      unauthorized: {
        modal:      "upgrade-required-modal",
        header:     "Plan Upgrade Required",
        content:    "This action requires the [plan name] plan, but your role on this app does not allow you to upgrade the plan.",
        authorized: false
      }
    },

    #
    deleteVerification: {
      app: {
        modal:    "delete-verification-modal",
        header:   "Delete [app-name]",
        content:  "Deleting this app will decommission all associated host machines and remove all code and data. Once complete, application data cannot be recovered. Are you sure you want to delete this app?",
        token:    "app.name"
        onSubmit:   (e)-> console.log e, "delete"
      },
      dataComponent: {
        modal:    "delete-verification-modal",
        header:   "Delete [component-id/nickname]",
        content:  "Deleting this component will remove all stored data. Once complete, this data cannot be recovered. Are you sure you want to delete this component?",
        token:    "data-component.name"
      }
    },

    #
    deleteConfirmation: {
      bundle: {
        modal:    "delete-confirmation-modal",
        header:   "Deactivate SSL/TLS Bundle",
        content:  "Are you sure you want to deactivate this bundle? HTTPS requests to the associated domain will fail or result in a security warning until a new bundle is activated."
      },
      account: {
        modal:    "delete-confirmation-modal",
        header:   "Delete Account",
        content:  "We're sorry to see you go. Are you certain you'd like to delete your account? If there's something we can do better, we'd love to know at <a mailto=\"hello@nanobox.io\">hello@nanobox.io.</a>"
      }
    },

    #
    actionConfirmation: {
      hostReboot: {
        modal:        "action-confirmation-modal",
        header:       "Reboot [host-id]",
        content:      "Rebooting this server will take it offline and components on this server will be inaccessible until the reboot is complete. Are you sure you want to reboot?",
        callToAction: "Reboot",
        token:        "host.name"
      },
      componentRefresh: {
        modal:        "action-confirmation-modal",
        header:       "Reboot [component-id / nickname]",
        content:      "Refreshing this component will take the service offline as the component processes are restarted. Are you sure you want to refresh?",
        callToAction: "Refresh",
        token:        "component.name"
      },
      componentReboot: {
        modal:        "action-confirmation-modal",
        header:       "Reboot [component-id / nickname]",
        content:      "Rebooting this component will take the service offline until the reboot is complete. Are you sure you want to reboot?",
        callToAction: "Reboot",
        token:        "component.name"
      },
      scaleUp: {
        modal:        "action-confirmation-modal",
        header:       "Scale Up",
        content:      "This action will increase your monthly cost with your hosting provider to approximately $[new-amount]/month. Do you wish to continue?",
        callToAction: "Scale",
        token:        "component.name"
      }
    }
  }

  #
  $(".modal-toggle").click (e) =>
    split  = $(e.currentTarget).data("modal").split("-")
    option = split[0]
    modal  = split[1]

    #
    nanobox.Modals.load(options[option][modal])
