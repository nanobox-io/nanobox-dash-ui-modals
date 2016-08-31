
## Usage
```coffeescript

# initialize and build the component
modals = new nanobox.Modals $("body")
modals.build()

options: {
  modal:    "upgrade-required-modal",
  header:   "Plan Upgrade Required",
  content:  "This action requires the [plan name] plan. Go to your app’s billing section to upgrade your plan.",
  path:     "#",
  onOpen:   onOpen,
  onSubmit: onSubmit,
  onClose:  onClose
}

# load a modal to show later
modals.load(options)
modals.show()

# load a modal and show it immediately
modals.loadAndShow(options)
```

#### Options
| Option=default | Description |
|---|---|
| modal="" | Modal template to use when loading the modal |
| header="" | Modal header content |
| content="" | Modal body content |
| callToAction="" | Modal "action button" content |
| path="" | Redirect path on submit (select modals only) |
| action="" | Form action (select modals only) |
| method="" | Form method (select modals only) |
| onOpen="" | Called when modal opens |
| onSubmit="" | Called when modal "submits" |
| onClose="" | Called when modal closes |

NOTE: if a modal has a path it wont have an action or method and vice versa

#### Modals
This is the current list of available modals and any [special options]:
* action-confirmation [action, method, token]
* delete-confirmation [action, method]
* delete-verification [action, method, token]
* upgrade-required [path]
