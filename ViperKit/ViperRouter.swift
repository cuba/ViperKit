//
//  ViperRouter.swift
//  ViperKit
//
//  Created by Jacob Sikorski on 2017-03-09.
//  Copyright © 2017 Tamarai. All rights reserved.
//

import Foundation

public protocol ViperRouter {
    func navigateTo(_ viewController: UIViewController, animated: Bool)
    func navigateBack(animated: Bool)
    func replace(_ viewController: UIViewController, options: UIViewAnimationOptions)
    func dismiss(animated: Bool, completion: (() -> Void)?)
}
