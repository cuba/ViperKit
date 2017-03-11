[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

# ViperKit
A Viper Design framework for iOS

## Features

- Adds ViewControllers  which bind the ViewController lifcycles to the interactor
- Has some commonly used presenter logic

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
class SomeRouter: ViperRouter {
    var viewController: ViewController
    
    func navigateTo(_ viewController: UIViewController, animated: Bool) {
        if let navigationController = viewController?.navigationController {
            navigationController.pushViewController(viewController, animated: animated)
        }
    }
    
    func navigateBack(animated: Bool) {
        let _ = viewController?.navigationController?.popViewController(animated: animated)
    }
    
    func dismiss(animated: Bool, completion: (() -> Void)?) {
        viewController.dismiss(animated: animated, completion: completion)
    }
    
    func replace(_ viewController: UIViewController, options: UIViewAnimationOptions) {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.replace(viewController, options: options)
        }
    }
}
```

Or use your ViewController as your router

```swift
extension ViewController: ViperRouter {
    func replace(_ viewController: UIViewController, options: UIViewAnimationOptions) {
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            delegate.replace(viewController, options: options)
        }
    }
    
    // ViperViewController already implements the default behaviours of the other
    // router methods
}
```

Create your own interactor
```swift
class SomeInteractor: ViperInteractor {
    var presenter: SomePresenter
    var router: SomeRouter
    
    init(_ viewController: ViewController) {
        presenter = SamplePresenter(viewController)
        router = viewController
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
