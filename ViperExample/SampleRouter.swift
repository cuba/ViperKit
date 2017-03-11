//
//  SampleRouter.swift
//  ViperExample
//
//  Created by Jacob Sikorski on 2017-03-10.
//  Copyright © 2017 Tamarai. All rights reserved.
//

import Foundation
import ViperKit

class SampleRouter: ViperRouter<UIViewController> {
    func replace(_ viewController: UIViewController, options: UIViewAnimationOptions) {
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            delegate.replace(viewController, options: options)
        }
    }
}
