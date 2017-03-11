//
//  ViperRouter.swift
//  ViperKit
//
//  Created by Jacob Sikorski on 2017-03-09.
//  Copyright © 2017 Tamarai. All rights reserved.
//

import Foundation

open class ViperRouter<V: UIViewController> {
    open var viewController: V?
    
    public init(_ viewController: V) {
        self.viewController = viewController
    }
    
    open func navigateTo(_ viewControllerToPresent: UIViewController, animated: Bool) {
        if let navigationController = viewController?.navigationController {
            navigationController.pushViewController(viewControllerToPresent, animated: animated)
        }
    }
    
    open func navigateBack(animated: Bool) {
        let _ = viewController?.navigationController?.popViewController(animated: animated)
    }
    
    open func dismiss(animated: Bool, completion: (() -> Void)?) {
        viewController?.dismiss(animated: animated, completion: completion)
    }
}
