window.init = () ->

  #
  modals = new nanobox.Modals $("body")
  modals.build()

  onOpen = () -> console.log "OPENED!"
  onSubmit = () -> console.log "SUBMITTED!"
  onClose = () -> console.log "CLOSED!"

  options = {

    #
    upgradeRequired: {
      authorized: {
        modal:    "upgrade-required-modal",
        header:   "Plan Upgrade Required",
        content:  "This action requires the [plan name] plan. Go to your app’s billing section to upgrade your plan.",
        path:     "#",
        onOpen:   onOpen,
        onSubmit: onSubmit,
        onClose:  onClose
      },
      unauthorized: {
        modal:    "upgrade-required-modal",
        header:   "Plan Upgrade Required",
        content:  "This action requires the [plan name] plan, but your role on this app does not allow you to upgrade the plan.",
        path:     undefined,
        onOpen:   onOpen,
        onSubmit: onSubmit,
        onClose:  onClose
      }
    },

    #
    deleteVerification: {
      app: {
        modal:    "delete-verification-modal",
        header:   "Delete [app-name]",
        content:  "Deleting this app will decommission all associated host machines and remove all code and data. Once complete, application data cannot be recovered. Are you sure you want to delete this app?",
        action:   "/some/path",
        method:   "DELETE",
        token:    "app.name",
        onOpen:   onOpen,
        onSubmit: onSubmit,
        onClose:  onClose
      },
      dataComponent: {
        modal:    "delete-verification-modal",
        header:   "Delete [component-id/nickname]",
        content:  "Deleting this component will remove all stored data. Once complete, this data cannot be recovered. Are you sure you want to delete this component?",
        action:   "/some/path",
        method:   "DELETE",
        token:    "data-component.name",
        onOpen:   onOpen,
        onSubmit: onSubmit,
        onClose:  onClose
      }
    },

    #
    deleteConfirmation: {
      bundle: {
        modal:    "delete-confirmation-modal",
        header:   "Deactivate SSL/TLS Bundle",
        content:  "Are you sure you want to deactivate this bundle? HTTPS requests to the associated domain will fail or result in a security warning until a new bundle is activated.",
        action:   "/some/path",
        method:   "PATCH",
        onOpen:   onOpen,
        onSubmit: onSubmit,
        onClose:  onClose
      },
      account: {
        modal:    "delete-confirmation-modal",
        header:   "Delete Account",
        content:  "We're sorry to see you go. Are you certain you'd like to delete your account? If there's something we can do better, we'd love to know at <a mailto=\"hello@nanobox.io\">hello@nanobox.io.</a>",
        action:   "/some/path",
        method:   "DELETE",
        onOpen:   onOpen,
        onSubmit: onSubmit,
        onClose:  onClose
      }
    },

    #
    actionConfirmation: {
      hostReboot: {
        modal:        "action-confirmation-modal",
        header:       "Reboot [host-id]",
        content:      "Rebooting this server will take it offline and components on this server will be inaccessible until the reboot is complete. Are you sure you want to reboot?",
        action:       "/some/path",
        method:       "PATCH",
        callToAction: "Reboot",
        token:        "host.name",
        onOpen:       onOpen,
        onSubmit:     onSubmit,
        onClose:      onClose

      },
      componentRefresh: {
        modal:        "action-confirmation-modal",
        header:       "Reboot [component-id / nickname]",
        content:      "Refreshing this component will take the service offline as the component processes are restarted. Are you sure you want to refresh?",
        action:       "/some/path",
        method:       "PATH",
        callToAction: "Refresh",
        token:        "component.name",
        onOpen:       onOpen,
        onSubmit:     onSubmit,
        onClose:      onClose

      },
      componentReboot: {
        modal:        "action-confirmation-modal",
        header:       "Reboot [component-id / nickname]",
        content:      "Rebooting this component will take the service offline until the reboot is complete. Are you sure you want to reboot?",
        action:       "/some/path",
        method:       "PATH",
        callToAction: "Reboot",
        token:        "component.name",
        onOpen:       onOpen,
        onSubmit:     onSubmit,
        onClose:      onClose

      },
      scaleUp: {
        modal:        "action-confirmation-modal",
        header:       "Scale Up",
        content:      "This action will increase your monthly cost with your hosting provider to approximately $[new-amount]/month. Do you wish to continue?",
        action:       "/some/path",
        method:       "PATH",
        callToAction: "Scale",
        token:        "component.name",
        onOpen:       onOpen,
        onSubmit:     onSubmit,
        onClose:      onClose

      }
    }
  }

  #
  $(".modal-toggle").click (e) =>
    split  = $(e.currentTarget).data("modal").split("-")
    option = split[0]
    modal  = split[1]

    #
    modals.loadAndShow(options[option][modal])
