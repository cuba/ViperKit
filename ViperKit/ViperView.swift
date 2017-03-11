//
//  ViperView.swift
//  ViperKit
//
//  Created by Jacob Sikorski on 2017-03-09.
//  Copyright © 2017 Tamarai. All rights reserved.
//

import Foundation

public protocol ViperView {
    func present(_ viewController: UIViewController, animated: Bool, completion: (() -> Swift.Void)?)
}
