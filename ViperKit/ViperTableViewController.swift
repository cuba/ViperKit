//
//  ViperTableViewController.swift
//  ViperKit
//
//  Created by Jacob Sikorski on 2017-03-09.
//  Copyright © 2017 Tamarai. All rights reserved.
//

import Foundation
import UIKit

open class ViperTableViewController: UITableViewController, ViperView {
    private lazy var activityIndicator = ViperActivityIndicator()
    open var interactor: ViperInteractor?
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.viewDidLoad()
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        interactor?.viewDidAppear()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor?.viewWillAppear()
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        interactor?.viewWillDisappear()
    }
    
    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        interactor?.viewDidDisappear()
    }
    
    open func showActivityIndicator() {
        if !activityIndicator.isAnimating {
            self.view.addSubview(self.activityIndicator)
            self.activityIndicator.startAnimating()
        }
    }
    
    open func hideActivityIndicator() {
        self.activityIndicator.stopAnimating()
        self.activityIndicator.removeFromSuperview()
    }
    
    open func navigateTo(_ viewController: UIViewController, animated: Bool) {
        if let navigationController = self.navigationController {
            navigationController.pushViewController(viewController, animated: animated)
        } else {
            present(viewController, animated: animated, completion: nil)
        }
    }
    
    open func navigateBack(animated: Bool) {
        let _ = navigationController?.popViewController(animated: animated)
    }
    
    open func replace(_ viewController: UIViewController, options: UIViewAnimationOptions) {
        // Nothing
    }
}
