[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

# ViperKit
A Viper Design framework for iOS

## Features

- Adds ViewControllers  which bind the ViewController lifcycles to the interactor
- Has some commonly used presenter logic
- Has some commonly used router logic

## Usage

Import ViperKit at the top of each swift file that uses the VIPER architecture.

```swift
import ViperKit
```

Extend `ViperViewController`, `ViperTableViewController` or `ViperCollectionViewController` in your ViewController
```swift
class ViewController: ViperViewController {
}
```

Create your own presenter
```swift
class SomePresenter: ViperPresenter<ViewController> {
    // Our ViewController extends ViperViewController which implements the 
    // ViperView protocol which is required by the presenter
}
```

Create your own router
```swift
class SomeRouter: ViperRouter<ViewController> {
    func replace(_ viewController: UIViewController, options: UIViewAnimationOptions) {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            // This assumes your appDelegate has the public method 'replace'
            // Which is responsible for replacing the current view with another one
            appDelegate.replace(viewController, options: options)
        }
    }
}
```

Create your own interactor
```swift
class SomeInteractor: ViperInteractor {
    var presenter: SomePresenter
    var router: SomeRouter
    
    init(_ viewController: ViewController) {
        presenter = SomePresenter(viewController)
        router = SomeRouter(viewController)
    }
}
```

Give your ViewController an interactor
```swift
let viewController = ViewController() // Or load from storyboard
viewController.interactor = ViperInteractor(viewController)
```

For more details and examples, this repository includes an Example Project.

### Setting up with Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that automates the process of adding frameworks to your Cocoa application.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate ViperKit into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "cuba/ViperKit"
```
